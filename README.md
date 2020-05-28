# Demo_BackgroundLocation

## Background Location Process

- setting plist file for User Location Authorization
- Adding Background Capability to Location Updates

- Import CoreLocation Framework
- Init Location Manager's delegate, disiredAccuracy

- Setting Location Manager's pausesLocationUpdatesAutomatically to false; 
- Setting Location Manager's allowsBackgroundLocationUpdates to ture;
- Setting Location Manager's showsBackgroundLocationIndicator to ture;
- Setting Location Manager's distanceFilter  to KCLDistanceFilterNone as default;
- deploying Location Manager's didUpdateLocations method to manipulate location data;
- deploying Setting Location Manager's didFailWithError method for error reports

- Ask for User Location Authorization
- Start Location Updates by startUpdatingLocation() method

- v0.2.0 Manually added Realm Framework
- v0.2.1 built realm model
- v0.2.2 built Log Table View
- v0.2.3 synchronising Log data with Table View
- v0.2.4 added tableview UIContextualAction( ) Delete
- added UITableView.didSelectRowAt( ) Highlight selected cell
    - configurated UITableView.selectedStyle to none
- v0.2.5 Clean up
- v0.3.0 add MapKit - Map View


