//
//  ScheduleMainTableViewController.swift
//  Diploma
//
//  Created by Ткачук Артем Сергеевич on 21.03.2022.
//

import UIKit
import SnapKit

enum ScheduleTableContainer {
    case subject(ReusableTableContainerViewModel<ScheduleTableViewCell>)
}

class ScheduleMainTableViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.delaysContentTouches = false
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    private var dataSource: [ScheduleTableContainer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupDataSource()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }        
    }
    
    private func setupDataSource() {
        let testCellViewModel: ScheduleTableContainer = {
            let viewModel = ScheduleTableViewCellViewModel(
                subjectName: "Залупа",
                teacherName: "Пизда",
                subjectType: "Туз",
                cabinetNumber: "Малафья"
            )
            return .subject(ReusableTableContainerViewModel<ScheduleTableViewCell>(viewModel: viewModel))
        }()
        dataSource.append(contentsOf: [testCellViewModel, testCellViewModel, testCellViewModel, testCellViewModel])
        tableView.reloadData()
    }
}

extension ScheduleMainTableViewController: UITableViewDelegate {
    
}

extension ScheduleMainTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource[indexPath.row] {
        case .subject(let viewModel):
            return tableView.dequeueReusableCellWithViewModel(viewModel: viewModel)
        }
    }
    
    
}
