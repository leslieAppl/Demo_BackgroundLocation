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
