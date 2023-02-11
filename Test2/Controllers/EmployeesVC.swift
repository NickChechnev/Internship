//
//  EmployeesVC.swift
//  Test2
//
//  Created by Никита Чечнев on 05.02.2023.
//

import UIKit
import Network

class EmployeesVC: UIViewController {
    
    private var employeesList: [Employee] = []
    
    let employeesTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(employeesTable)
        employeesTable.delegate = self
        employeesTable.dataSource = self
        getEmployeeList()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        employeesTable.frame = view.bounds
    }
    
    func getEmployeeList() {
        DataManager.shared.getEmployees { [weak self] result in
            switch result {
            case .success(let employees):
                self?.employeesList = employees.sorted(by: { $0.name < $1.name })
                DispatchQueue.main.async {
                    self?.employeesTable.reloadData()
                }
            case .failure( _):
                DispatchQueue.main.async {
                    self?.presentAC(withTitle: "Error", message: APIErrors.networkLost.rawValue, style: .alert)
                }
            }
        }
    }
}

extension EmployeesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Employees"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: employeesList[indexPath.row])
        return cell
    }
    
    
}
