//
//  HospitalDetailViewController.swift
//  Sensyne
//
//  Created by Melwin Jose Kottayil on 1/21/20.
//  Copyright © 2020 TestEnvironment. All rights reserved.
//

import UIKit

class HospitalDetailViewController: UIViewController {

    @IBOutlet weak var lblHospitalName: UILabel!
    @IBOutlet weak var lblHospitalCode: UILabel!
    @IBOutlet weak var lblHospitalId: UILabel!
    @IBOutlet weak var lblHospitalAddress: UILabel!
    @IBOutlet weak var lblHospitalCity: UILabel!
    @IBOutlet weak var lblHospitalCountry: UILabel!
    @IBOutlet weak var lblHospitalPostcode: UILabel!
    @IBOutlet weak var lblHospitalPhone: UILabel!
    @IBOutlet weak var lblHospitalEmail: UILabel!
    
    var hospitalDetails : [String : String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let orgName = hospitalDetails!["OrganisationName"] {
            lblHospitalName.text = "Organisation Name: \(orgName)"
        }
        if let orgCode = hospitalDetails!["OrganisationCode"] {
            lblHospitalCode.text = "Organisation Code: \(orgCode)"
        }
        if let orgId = hospitalDetails!["OrganisationID"] {
            lblHospitalId.text = "Organisation Id: \(orgId)"
        }
        if let orgAddress1 = hospitalDetails!["Address1"], let orgAddress2 = hospitalDetails!["Address2"]{
            lblHospitalAddress.text = "Organisation Address: \(orgAddress1),\(orgAddress2)"
        } else if let orgAddress1 = hospitalDetails!["Address1"]{
            lblHospitalAddress.text = "Organisation Address: \(orgAddress1)"
        }
        if let orgCity = hospitalDetails!["City"] {
            lblHospitalCity.text = "Organisation City: \(orgCity)"
        }
        if let orgCounty = hospitalDetails!["County"] {
            lblHospitalCountry.text = "Organisation County: \(orgCounty)"
        }
        if let orgPostcode = hospitalDetails!["Postcode"] {
            lblHospitalPostcode.text = "Organisation Postcode: \(orgPostcode)"
        }
        if let orgPhone = hospitalDetails!["Phone"] {
            lblHospitalPhone.text = "Organisation Phone: \(orgPhone)"
        }
        if let orgEmail = hospitalDetails!["Email"] {
            lblHospitalEmail.text = "Organisation Email: \(orgEmail)"
        }
    }
}
