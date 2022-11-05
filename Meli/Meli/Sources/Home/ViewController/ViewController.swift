//
//  ViewController.swift
//  Meli
//
//  Created by Jhonnatan Macias on 31/10/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let pageTitle: String = "Mercado Libre"
        static let itemCellIdentifier: String = ResultViewCell.reuseIdentifier
    }

    // MARK: - Properties

    private let searchController = UISearchController(searchResultsController: nil)
    private var tableView: UITableView = {
        let tableView = UITableView.newAutolayoutTableView()
        return tableView
    }()

    private let loadingVC = LoadingViewController()

    private var viewModel: HomeViewModelProtocol? {
        didSet {
            loadViewIfNeeded()

            viewModel?.itemModel.bindAndFire { [weak self] _ in
                guard let self = self else {
                      return
                }

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

//            viewModel?.cellsViewModel.bindAndFire { [weak self] _ in
//                guard let self = self else {
//                      return
//                }
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }

            viewModel?.displaySpinner = { [weak self]  in
                guard let self = self else {
                      return
                }

                self.displaySpinner()
            }

            viewModel?.hideSpinner = { [weak self]  in
                guard let self = self else {
                      return
                }

                self.hideSpinner()
            }

            viewModel?.presentError = { [weak self] in
                guard let self = self else {
                    return
                }

                self.presentError()
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        constructView()
        constructSubviewHierarchy()
        constructSubviewLayoutConstraints()

        viewModel = HomeViewModel()
    }

    private func constructView() {
        title = Constants.pageTitle
        view.backgroundColor = .white

        setupTableView()
        setupSearchView()
    }

    private func constructSubviewHierarchy() {
        view.addSubview(tableView)
    }

    private func constructSubviewLayoutConstraints() {
        NSLayoutConstraint.activate([ConstraintUtil.pinTopOfView(tableView, toTopOfView: view,
                                                                         withMargin: 4),
                                     ConstraintUtil.pinLeftOfView(tableView, toLeftOfView: view),
                                     ConstraintUtil.pinRightOfView(tableView, toRightOfView: view),
                                     ConstraintUtil.pinBottomOfView(tableView, toBottomOfView: view)
        ])

    }

    private func setupSearchView() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Items"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func setupTableView() {
        tableView.register(ResultViewCell.self, forCellReuseIdentifier: Constants.itemCellIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
    }

    // MARK: - Internal Functions

    private func displaySpinner() {
        // Animate loadingVC over the existing views on screen
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.loadingVC.modalPresentationStyle = .overCurrentContext
            self.loadingVC.modalTransitionStyle = .crossDissolve

            self.present(self.loadingVC, animated: true, completion: nil)
        }
    }

    private func presentError() {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: "Error", message: "Ooops! Un error ocurrió, intenté nuevamente",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }

    }

    private func hideSpinner() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            self.loadingVC.dismiss(animated: true, completion: nil)
        }

    }

}

extension ViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let title = searchBar.text?.trimmingCharacters(in: CharacterSet.whitespaces) {
            viewModel?.getItems(itemTitle: title)
        }
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }

        return viewModel.cellsViewModel.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }

        let cell: ResultViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.viewModel = viewModel.cellsViewModel.value[indexPath.row]
        return cell
    }
}
