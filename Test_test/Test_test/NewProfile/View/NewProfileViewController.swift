//
//  NewProfileViewController.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/27/24.
//

import UIKit

final class NewProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = .white
        tableView.estimatedSectionHeaderHeight = 50
//        if #available(iOS 15, *) {
//
//        }
        tableView.register(ProfileMainPictureCell.self,
                           forCellReuseIdentifier: ProfileMainPictureCell.reuseIdentifier)
        tableView.register(NewProfileFieldDataCell.self,
                           forCellReuseIdentifier: NewProfileFieldDataCell.reuseIdentifier)
        tableView.register(NewProfileFieldAboutUserDataCell.self,
                           forCellReuseIdentifier: NewProfileFieldAboutUserDataCell.reuseIdentifier)
        tableView.register(NewProfileRegularSectionHeader.self,
                           forHeaderFooterViewReuseIdentifier: NewProfileRegularSectionHeader.reuseIdentifier)
        return tableView
    } ()
    
    private var viewModel: NewProfileViewModelType!
    
    init(viewModel: NewProfileViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder decoder: NSCoder) {
        fatalError("Do not use")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupBindings()
        viewModel.didLoad()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
    }
    
    private func setupConstraints() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: TableView
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupBindings() {
        viewModel.didLoadUserData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        viewModel.onError = { [weak self] errorString in
            print(errorString)
        }
    }
    
    //пример нажатия кнопки
//    @objc private func buttonTapped() {
//        DispatchQueue.main.async {
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
}

extension NewProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sectionViewModels.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sectionViewModels[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let mainSectionViewModel = viewModel.sectionViewModels[indexPath.section].mainDataSection {
            return getCellFromMainSection(
                tableView,
                cellForRowAt: indexPath,
                mainSectionViewModel: mainSectionViewModel
            )
        } else if let regularDataSectionViewModel = viewModel.sectionViewModels[indexPath.section].regularDataSection {
            if indexPath.row == 0 {
                return getAgeGenderCellFromRegularSection(
                    tableView,
                    cellForRowAt: indexPath,
                    regularSectionViewModel: regularDataSectionViewModel
                )
            } else  if indexPath.row == 1 {
                return getLocationCellFromRegularSection(
                    tableView,
                    cellForRowAt: indexPath,
                    regularSectionViewModel: regularDataSectionViewModel
                )
            } else {
                return getAboutMeCellFromRegularSection(
                    tableView,
                    cellForRowAt: indexPath,
                    regularSectionViewModel: regularDataSectionViewModel
                )
            }
        } else {
            return UITableViewCell()
        }
    }
    
    private func getAgeGenderCellFromRegularSection(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath,
        regularSectionViewModel: NewProfileRegularSectionViewModel
    ) -> UITableViewCell {
        if let fieldDataCellViewModel = regularSectionViewModel.ageGender,
           let cell = tableView.dequeueReusableCell(withIdentifier: NewProfileFieldDataCell.reuseIdentifier, for: indexPath) as? NewProfileFieldDataCell {
            cell.configurate(viewModel: fieldDataCellViewModel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    private func getLocationCellFromRegularSection(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath,
        regularSectionViewModel: NewProfileRegularSectionViewModel
    ) -> UITableViewCell {
        if let fieldDataCellViewModel = regularSectionViewModel.location,
           let cell = tableView.dequeueReusableCell(withIdentifier: NewProfileFieldDataCell.reuseIdentifier, for: indexPath) as? NewProfileFieldDataCell {
            cell.configurate(viewModel: fieldDataCellViewModel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    private func getAboutMeCellFromRegularSection(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath,
        regularSectionViewModel: NewProfileRegularSectionViewModel
    ) -> UITableViewCell {
        let fieldDataCellViewModel = regularSectionViewModel.aboutMe
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewProfileFieldAboutUserDataCell.reuseIdentifier,
                                                    for: indexPath) as? NewProfileFieldAboutUserDataCell {
            cell.configurate(viewModel: fieldDataCellViewModel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    private func getCellFromMainSection(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath,
        mainSectionViewModel: NewProfileMainSectionViewModel
    ) -> UITableViewCell {
        if let topCellViewModel = mainSectionViewModel.topCellViewModel,
           let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMainPictureCell.reuseIdentifier, for: indexPath) as? ProfileMainPictureCell {
            cell.configurate(viewModel: topCellViewModel)
        return cell
        }
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if viewModel.sectionViewModels[section].mainDataSection != nil {
            return nil
        } else if let regularDataSectionViewModel = viewModel.sectionViewModels[section].regularDataSection,
                  let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewProfileRegularSectionHeader.reuseIdentifier) as? NewProfileRegularSectionHeader {
            headerView.configurate(viewModel: regularDataSectionViewModel.headerViewModel)
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel.sectionViewModels[section].mainDataSection != nil {
            return .leastNonzeroMagnitude
        } else if let _ = viewModel.sectionViewModels[section].regularDataSection,
                  let _ = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: NewProfileRegularSectionHeader.reuseIdentifier
                  ) as? NewProfileRegularSectionHeader {
            return UITableView.automaticDimension
        } else {
            return .leastNonzeroMagnitude
        }
    }
    
}

extension NewProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
