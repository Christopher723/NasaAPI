# NasaPOTDApp
SwiftUI app utilizing Nasa open api. Allows users to pick a day and display the image of that day

## Screenshots
<img width="286" alt="Screenshot 2024-04-01 at 2 22 23 PM" src="https://github.com/Christopher723/NasaPOTDApp/assets/101473798/2d89588b-2c02-4b44-8744-b9b09c49909d">

## Api Reference
Uses nasa APOD api
https://api.nasa.gov

#### Get Picture

```http
  GET "https://api.nasa.gov/planetary/apod?api_key={APIkey}&date={date}"
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `APIKey`      | `string` | **Required**. Your api key|
| `date`      | `string` | **Required**. Date of picture("yyyy-MM-dd") |

