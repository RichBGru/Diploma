//
//  ReusableTableContainerViewModel.swift
//  Diploma
//
//  Created by Ткачук Артем Сергеевич on 23.03.2022.
//

import Foundation
import UIKit

public struct ReusableTableContainerViewModel<View: UIView & ViewModelSettable> {
    public typealias CellType = ReusableTableContainerCell<View>
    public typealias ViewModel = View.ViewModel
    public let viewModel: View.ViewModel
    public let selectionStyle: UITableViewCell.SelectionStyle

    public init(viewModel: View.ViewModel,
                selectionStyle: UITableViewCell.SelectionStyle = .none) {
        self.viewModel = viewModel
        self.selectionStyle = selectionStyle
    }
}
