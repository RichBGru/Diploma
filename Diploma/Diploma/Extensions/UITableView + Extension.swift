//
//  UITableView + Extension.swift
//  Diploma
//
//  Created by Ткачук Артем Сергеевич on 23.03.2022.
//

import Foundation
import UIKit

extension UITableView {
    public func dequeueReusableCellWithViewModel<View: UIView & ViewModelSettable>(viewModel: ReusableTableContainerViewModel<View>) -> ReusableTableContainerViewModel<View>.CellType {
        let id = String(describing: ReusableTableContainerViewModel<View>.CellType.self)
        if let cell = dequeueReusableCell(withIdentifier: id) as? ReusableTableContainerViewModel<View>.CellType {
            cell.setup(with: viewModel)
            return cell
        } else {
            register(ReusableTableContainerViewModel<View>.CellType.self, forCellReuseIdentifier: id)
            return dequeueReusableCellWithViewModel(viewModel: viewModel)
        }
    }
}
