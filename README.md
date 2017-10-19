# App Name : Tools Down

##  Model User

- email:string

user has_one: profile
user has_many: schedule

## Model Profile

- image_data: text
- first_name: string
- last_name: string
- user:references

## Schedule
- title: string
- start_time: datetime
- end_time: datetime
- message: text
- user: references

schedule has_one: reason

## Reason
- description: text
- type: string
- schedule: references

Trello

source : https://trello.com/b/hVHQ6Bai/ca-hackathone1


## Database Diagram

![](app/assets/images/DBDiagram.png)


<!-- ![](https://www.danmartell.com/wp-content/uploads/2014/10/Maslows-Hierarchy-of-Needs-1024x791.jpg) -->


## Wireframes
![](app/assets/images/Wireframe.png)
![](app/assets/images/ColorPallette.png)
![](app/assets/images/FontStyle.png)


source : https://www.figma.com/file/QbBRV41PrEE4PIa4HUuOxDDY/Tools-Down




