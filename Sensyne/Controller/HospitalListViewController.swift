//
//  ViewController.swift
//  Sensyne
//
//  Created by Melwin Jose Kottayil on 1/21/20.
//  Copyright © 2020 TestEnvironment. All rights reserved.
//

import UIKit
import SwiftCSV

class HospitalListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CustomSearchControllerDelegate {
    
    @IBOutlet weak var hospitalListTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    
  
    var shouldShowSearchResults = false
    var customSearchController: CustomSearchController!
    
    var hospitalListDictionary : [[String:String]] = []
    var filteredHospitalJSONList : [AnyObject] = []
    var selectedHospital : [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchView()
        setupNavBar()
        fetchData()
    }
    
    func fetchData() {
        //Fetch the data from the file Hospital.csv
        hospitalListDictionary = Service.shared.fetchDataFromFile()
        //Convert the data to Dictionary format
        hospitalJSONList = convertToDictionary(list: hospitalListDictionary) as? [AnyObject] ?? []
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hospitalListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return filteredHospitalJSONList.count
        } else {
            return hospitalJSONList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as? HomeListTableViewCell
        //Filtered List while searching for hospital
        if shouldShowSearchResults {
            cell?.hospitalNameLabel.text = filteredHospitalJSONList[indexPath.row]["OrganisationCode"] as? String
            cell?.hospitalIdLabel.text = filteredHospitalJSONList[indexPath.row]["OrganisationID"] as? String
            cell?.hospitalDescriptionLabel.text = filteredHospitalJSONList[indexPath.row]["OrganisationName"] as? String
        } else {
            //Original List while searching for hospital
            cell?.hospitalNameLabel.text = hospitalJSONList[indexPath.row]["OrganisationCode"] as? String
            cell?.hospitalIdLabel.text = hospitalJSONList[indexPath.row]["OrganisationID"] as? String
            cell?.hospitalDescriptionLabel.text = hospitalJSONList[indexPath.row]["OrganisationName"] as? String
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.shouldShowSearchResults {
            selectedHospital = (self.filteredHospitalJSONList[indexPath.row] as? [String : String])!
        } else {
            selectedHospital = (hospitalJSONList[indexPath.row] as? [String : String])!
        }
        //Navigating to the Detail View Controller to list the details of a particular hospital
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "HospitalDetailViewController") as! HospitalDetailViewController
        detailViewController.hospitalDetails =  selectedHospital
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone: return 90
        case .pad: return 80
        case .unspecified: break
        default : break
        }
        return 0
    }
    
    func configureSearchController() {
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRect(x: 0, y: 0, width: self.searchView.frame.width, height: self.searchView.frame.height), searchBarFont: UIFont.boldSystemFont(ofSize: 14), searchBarTextColor: UIColor.blue, searchBarTintColor: UIColor.white)
        customSearchController.customSearchBar.placeholder = "Search Hospital"
        searchView.addSubview(customSearchController.customSearchBar)
        customSearchController.customDelegate = self
    }
    
    // MARK: UISearchBarDelegate functions
    func didStartSearching() {
        shouldShowSearchResults = true
        hospitalListTableView.reloadData()
    }
    
    func didTapOnCancelButton() {
        shouldShowSearchResults = false
        filteredHospitalJSONList = hospitalJSONList
        hospitalListTableView.reloadData()
    }
    
    func didTapOnSearchButton() {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            hospitalListTableView.reloadData()
        }
    }
    
    // MARK: UISearchResultsUpdating delegate function
    func didChangeSearchText(_ searchText: String) {
        // If we haven't typed anything into the search bar then do not filter the results
        if customSearchController.customSearchBar.text! != "" {
            filteredHospitalJSONList = hospitalJSONList.filter({
                ($0["OrganisationCode"]! as AnyObject).contains(searchText.uppercased())
            })
            shouldShowSearchResults = true
        }
        hospitalListTableView.reloadData()
    }
    
    func alertMessage(alerttitle:String,_ message : String) {
        let alertViewController = UIAlertController(title:alerttitle,  message:message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
    
    func setupTableView() {
        hospitalListTableView.rowHeight = UITableView.automaticDimension
        hospitalListTableView.estimatedRowHeight = 90.0
        hospitalListTableView.delegate = self
        hospitalListTableView.dataSource = self
        hospitalListTableView.tableFooterView = UIView()
    }
    
    func setupSearchView() {
        searchView.clipsToBounds = true
        searchView.layer.cornerRadius = 5
        searchView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        configureSearchController()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
