//
//  TableViewController.swift
//  VFLCustomeCell
//
//  Created by htomcat on 2017/10/04.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let dataStore = [["team": "Cleveland Indians",
                      "league": "American",
                      "division": "Central",
                      "color": 0xF31B10],
                     ["team": "New York Yankees",
                      "league": "American",
                      "division": "East",
                      "color": 0x000000],
                     ["team": "Colorado Rockies",
                      "league": "National",
                      "division": "West",
                      "color": 0x0E0A85],
                     ["team": "Arizona Diamondbacks",
                      "league": "National",
                      "division": "West",
                      "color": 0xA02206]]
    var infos = [VFLModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MLB World Series 2017"
        tableView.register(VFLCustomTableViewCell.self, forCellReuseIdentifier: "VFLCustomTableViewCell")
        dataStore.forEach { data in
            let model = VFLModel(team: data["team"] as? String ??  "",
                                 league: data["league"] as? String ?? "",
                                 division: data["division"] as? String ?? "",
                                 color: data["color"] as? Int ?? 0)
            infos.append(model)
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "VFLCustomTableViewCell", for: indexPath) as? VFLCustomTableViewCell else {
                return UITableViewCell()
        }
        let info = infos[indexPath.row]
        cell.configure(with: info)
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Wild Series"
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
}
