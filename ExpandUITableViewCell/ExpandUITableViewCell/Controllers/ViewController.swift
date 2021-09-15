//
//  ViewController.swift
//  ExpandUITableViewCell
//
//  Created by k-aoki on 2021/09/15.
//

import UIKit

class ViewController: UIViewController {

    // MARK: UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return tableView
    }()


    // MARK: Variables
    private var sections = [Section]()


    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()

        setupModels()
        setupTableView()
    }
}


// MARK: - Setup
private extension ViewController {

    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.frame = view.bounds
    }

    func setupModels() {
        sections = [
            Section(title: "Section 1", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 2", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 3", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 4", options: [1, 2, 3].compactMap({ return "Cell \($0)" }))
        ]
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]

        if section.isOpened {
            return section.options.count + 1
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title

        } else {
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
        }

        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
}
