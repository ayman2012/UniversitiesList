//
//  UniversitiesListViewController.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 01/05/2024.
//

import UIKit

// MARK: - UniversitiesListViewController Class
class UniversitiesListViewController: UIViewController, Loadable, Alertable {
    
    // MARK: - Outlets
    @IBOutlet weak var universitiesTableView: UITableView!
        
    // MARK: - Proprieties
    var presenter: UniversitiesListPresenterProtocol
    
    // MARK: - Initialization
    init(presenter: UniversitiesListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Universities List"
        setupTableView()
        presenter.viewDidLoad()
    }
    
    // MARK: - Utilities Methods
    private func setupTableView() {
        universitiesTableView.register(UniversitiesListTableViewCell.nib, forCellReuseIdentifier: UniversitiesListTableViewCell.identifier)
        universitiesTableView.delegate = self
        universitiesTableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate Extension
extension UniversitiesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.navigateToDetailsViewFor(index: indexPath.row)
    }
}

// MARK: - UITableViewDataSource Extension
extension UniversitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getNumberOfUniversitiesList() 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UniversitiesListTableViewCell.identifier, for: indexPath) as? UniversitiesListTableViewCell else { return UITableViewCell() }
        cell.setupCellWith(dataModel: presenter.getUniversityModelFor(index: indexPath.row))
        return cell
    }
}

// MARK: - UniversitiesListViewProtocol Extension
extension UniversitiesListViewController: UniversitiesListViewProtocol {
    
    func onFetchUniversitiesListSuccess() {
        universitiesTableView.reloadData()
    }
    
    func onFetchUniversitiesListFailure(error: String) {
        showAlert(title: "Error", message: error)
    }
    
    func showLoader() {
        showLoading(show: true)
    }
    
    func hideLoader() {
        showLoading(show: false)
    }
}
