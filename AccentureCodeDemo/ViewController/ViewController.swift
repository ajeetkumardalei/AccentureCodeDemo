//
//  ViewController.swift
//  AccentureCodeDemo
//
//  Created by AjeetZone on 07/04/20.
//  Copyright © 2020 AjeetZone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dashbdViewmodel = DashboardViewModel.init()

    var model = CanadaInfo()
    var arrInfo = [Row]()
    
    private lazy var refreshCtrl: UIRefreshControl = {
        let refreshContol = UIRefreshControl()
        refreshContol.tintColor = .red
        refreshContol.attributedTitle = NSAttributedString(string: "Pull To Refresh...")
        return refreshContol
    }()

    lazy var tblvw: UITableView = {
        let table = UITableView()
        table.separatorColor = .lightGray

        table.register(DashboardCell.self, forCellReuseIdentifier: CellManager.cellIdentifier)
        
        table.dataSource = self
        table.delegate = self
        return table
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableview()
        refreshCtrl.addTarget(self, action: #selector(doRefresh(_ :)), for: .valueChanged)
        dashbdViewmodel.delegate = self as? DashboardDelegate
        getAboutCanada()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setUpNavigation(with title:String?) {
        navigationItem.title = title
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    func setupTableview() {
        self.view.addSubview(tblvw)

        tblvw.translatesAutoresizingMaskIntoConstraints = false
        tblvw.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tblvw.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tblvw.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tblvw.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tblvw.tableFooterView = UIView()
        tblvw.estimatedRowHeight = UITableView.automaticDimension
        tblvw.rowHeight = 400

        if #available(iOS 10.0, *) {
            tblvw.refreshControl = refreshCtrl
        } else {
            tblvw.addSubview(refreshCtrl)
        }
        

    }
    
    @objc func doRefresh(_ sender:UIRefreshControl) {
        sender.endRefreshing()
        getAboutCanada()
    }
}

private typealias APIConfiguration = ViewController
extension APIConfiguration {
    @objc func getAboutCanada() {
        DispatchQueue.main.async {
            Helper.sharedInstance.showLoader()
        }

        if APIManager.shared.connectedToNetwork() {
            dashbdViewmodel.apiCallForDashboard(true) { (isSuccess) in
                if isSuccess {
                    let fullmodel = self.dashbdViewmodel.canadaInfoModel
                    
                    DispatchQueue.main.async {[weak self] in
                        guard let selfS = self else {return}
                        
                        //selfS.navigationItem.title = fullmodel.title
                        selfS.setUpNavigation(with: fullmodel.title)
                        if let temparr = fullmodel.rows, temparr.count > 0 {
                            selfS.arrInfo = temparr
                            
                            selfS.tblvw.reloadData()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                Helper.sharedInstance.hideLoader()
                            })

                        }
                    }
                }
            }

        } else {
            debugPrint(NetWorkManager.nonetworkMessage)
            self.showAlertSimple(title: "No Network!", msg: NetWorkManager.nonetworkMessage, isAutoDismiss: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                Helper.sharedInstance.hideLoader()
            })

        }

    }
    
}

private typealias TableviewConfiguration = ViewController
extension TableviewConfiguration: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellManager.cellIdentifier) as? DashboardCell else {return UITableViewCell()}
        if arrInfo.count > 0 {
            let item = arrInfo[indexPath.row]
            cell.configureCell(with: item)
            return cell
        }
        
        return UITableViewCell()
    }

}

extension TableviewConfiguration: UITableViewDelegate {

}



