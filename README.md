# grocerybasket

The program have a basic MVC architecture with a service layer to load the data.
From a JSON file containing products I load them into a Product model using ObjectMapper. The DataLoader file is a singleton service class that parses the json and, using the fabric pattern, generates an array of Product models. This array is going to be used as the data source of the table view in the UI layer. To fill the table I added an Observer to the DataLoader that notifies the view controller when the data is loaded from the source to reload the table.
