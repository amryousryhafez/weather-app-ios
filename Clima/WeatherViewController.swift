//
//  ViewController.swift
//  WeatherApp
//


import UIKit
import CoreLocation
import  Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController,CLLocationManagerDelegate,getCity
    //The methods that you use to receive events from an associated location manager object
    // should conform rules of coreLocationmANAGEMENT TO BE delegate of locationManager class
    
    
    
{
    
    
    

            let weatherData=WeatherDataModel()
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let ID_APP = "a8ec9276bf57c8766abefdf2af4f2f7c"
    
    
    var locationManager = CLLocationManager()
    
    
    
    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization() //Requests permission to use location data and manage authorization popup
        locationManager.startUpdatingLocation() //Asynchronouse method run in background to get gps location of iphone

    
    }
    
    
    func getWeatherData(url: String, parameters: [String: String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                
                print("Success! Got the weather data")
                let weatherJSON : JSON = JSON(response.result.value!)
                
                
                print(weatherJSON)
                
                self.updateWeatherData(json: weatherJSON)
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
                self.cityLabel.text = "Connection Issues"
            }
        }
        
    }
    
    
    
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    
    func updateWeatherData(json : JSON ) {
        

        
        if let tempDouble=json["main"]["temp"].double {
        
weatherData.temp=Int(tempDouble-273.15)
        
        weatherData.condition=json["weather"][0]["id"].intValue
        
        weatherData.weatherIconName=weatherData.updateWeatherIcon(condition: weatherData.condition)+".png"
        
        
        weatherData.City=String(describing: json["name"])
        updateUI()

        }
        else
        {
            cityLabel.text="unavailable weather here"
            
        }
    }
    
    
    
    
    
    func updateUI(){
        weatherIcon.image=UIImage(named:weatherData.weatherIconName)
        temperatureLabel.text=String("\(weatherData.temp)°")
        cityLabel.text = String(weatherData.City)

    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let     locations = locations[locations.count-1]
        
        if locations.horizontalAccuracy > 0
        {
            locationManager.stopUpdatingLocation()
            print(locations.coordinate.latitude , locations.coordinate.longitude)
            
            let longitude = String(locations.coordinate.longitude)
            let latitude = String(locations.coordinate.latitude)
            
            
            let dictionary : [String:String] = ["lon" : longitude, "lat" : latitude, "appid" : ID_APP]

            print(dictionary["appid"]!)
            getWeatherData(url: WEATHER_URL, parameters: dictionary)
            
            
        }
        
        
        
    }
    
    
    

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        cityLabel.text=("failed to get data")
    }

    
    func changeWeatherCity(City:String)
    {
        let param:[String:String]=["q":City,"appid":ID_APP]
        getWeatherData(url: WEATHER_URL, parameters: param)
    }
    
// - Change City Delegate methods
    /***************************************************************/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VCSegue = segue.destination as? ChangeCityViewController
  VCSegue?.delegate=self
    }
    

    
    
 
    
    
    
    
    
}


