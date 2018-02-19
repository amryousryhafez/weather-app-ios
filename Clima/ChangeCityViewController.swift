//
//  ChangeCityViewController.swift
//  WeatherApp
//


import UIKit


protocol getCity {
    func changeWeatherCity(City:String)
}



class ChangeCityViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    var cityLabel=""
    
    @IBOutlet weak var countryLabel: UILabel!
    
    
    @IBOutlet weak var icon: UILabel!
    
    
    
    
    @IBOutlet weak var label1: UILabel!
    
    
    
    
    let cityArray=["Cairo","London","Alex","Paris","Dakar","Boston","Roma","Berlin","Doha","Oman","Sanaa","Madrid","Mecca","Manama","Manchester","Lisbon","Nairobi","Porto","Colorado","Texas"]
    
    let countryArray = ["Egypt","United Kingdom","Egypt","France","Senegal","USA","Italy","Germany","Qatar","Oman","Yemen","Spain","Saudi Arabia","Bahrain","United Kingdom","Portugal","Kenya","Portugal","USA","USA"]
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell")as! TableViewCell
    cell.labelOne.text=cityArray[indexPath.row]

   // cell.buttonUI.tag=indexPath.row
        
    cell.labelTwo.text=countryArray[indexPath.row]
        cell.labelOne.text=cityArray[indexPath.row]
        cell.buttonUI.tag=indexPath.row
        
        print(cell.buttonUI.tag)

  //      cityLabel=cityArray[cell.buttonUI.tag]

        
    countryLabel.layer.borderWidth=1
        countryLabel.layer.borderColor=UIColor.black.cgColor
        label1.layer.borderWidth=1
        label1.layer.borderColor=UIColor.black.cgColor
        
        icon.layer.borderWidth=1
        icon.layer.borderColor=UIColor.black.cgColor

      //  navigationController?.popToRootViewController(animated: true)

        return cell
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
         cityLabel=cityArray[sender.tag]
        delegate?.changeWeatherCity(City: cityLabel)
       
        
        
        
        navigationController?.popToRootViewController(animated: true)
    }
    

    
    var delegate:getCity?

    
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!

    

    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        
        delegate?.changeWeatherCity(City: changeCityTextField.text!)
        
navigationController?.popToRootViewController(animated: true)

        
    }
    override func viewDidLoad() {
tableView.delegate=self
        tableView.dataSource=self
        tableView.reloadData()
        
    
    
    }

    


    
    
    
    
    
    
    

}
