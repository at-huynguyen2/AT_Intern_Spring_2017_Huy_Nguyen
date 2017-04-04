#`Daily report SQL 4/4/2017`




##1. Window Function

	Usage: Execute complex query at current table.

	Key word most important is OVER to indentifical Window Function

	Example:  

| Studen_name | Class_name | Point  | avg |

| :-------- | --------:| :--: |

| Huy  | A | 5  |7|

| Hung | A | 10 |7|

| Tuan | A | 6  |7|


| Dung | B | 3  |5|

| Binh | B | 7  |5|

``` SQL

	SELECT Studen_name, Class_name, avg( Point) 

			OVER (PARTITION BY Studen_name) 

			FROM Student;

```

	Explain: *OVER : key word Window Function PARTITION BY: difine divice each row to group follow average* salary

##2. SQL with NoSQL

	* SQL is database manager tradition.  SQL storage data format table contain row and column, each row will have key respectively. 

	example: 

| id |name | salary  | 

| :-------- | --------:|

| 0 | Huy | 5  |

| 1 | Hung | 10 |

| 2 | Tuan | 6  |

| 3 | Dung | 3  |

	* NoSQL is type storage appear before SQL, storage data key and value as hash array.

```  json

{"widget": {

    "debug": "on",

    "window": {

        "title": "Sample Konfabulator Widget",

        "name": "main_window",

        "width": 500,

        "height": 500

    },

    "image": { 

        "src": "Images/Sun.png",

        "name": "sun1",

        "hOffset": 250,

        "vOffset": 250,

        "alignment": "center"

    }

}

``` 

**Compare SQL with NoSQL**

| - |Performance | Scalability  | Felexibility | Complexity |  

| :------------- | --------:|

| Key-value store | `high` | `high`  | `high` | low |

| Colomn store | `high` | `high` | modelate | none |

| Document database | `high` | Variable(high)  | `high` | none |

| Graph database | Variable | Variable  | `high` | `high` |

 * **Key-value model : **   the least complex NoSQL option, which stores data in a schema-less way that consists of indexed keys and values

 * **Column store :** wide-column store, which stores data tables as columns rather than rows. It’s more than just an inverted table—sectioning 
out columns allows for excellent scalability and high performance

 * **Document database :** taking the key-value concept and adding more complexity, each document in this type of database has its own data, 
and its own unique key, which is used to retrieve it. It’s a great option for storing, retrieving and managing data that’s document-oriented 
but still somewhat structured.

 * **Graph database :** have data that’s interconnected and best represented as a graph? This method is capable of lots of complexity.





### 3. Compare Type of Storage Engine mySQL

	* MyISAM storage engine: Is default type storage engine for version less 5.0

			- Not support full-text indexing

			- - Not support transaction

		=> Feature: Not save table when update or delete so quick more than 	 because it not support transaction



	* InnoDB storage engine: Is default type storage engine for version current

			- Support full-text indexing

			-  Support transaction

		=> Feature: slow more than with MyISAM because support transaction but it preserve data when CRUD interrupt.

	* Memory storage engine: save data in RAM of server

		=> Feature: Very quick because it save at RAM but data will lost 	when reset server.

###4. How to youtube storage database

	Youtube use main Database manager is mySQL.	

	Youtube dicive main table:		

		1. Table meta: save user’s information as: user name, 				password,etc...		

		2. Table Videos: save info of video: length time, capacity, url,etc…

		3. Table view: save times views, shares, user’s comment for video

		4. Table Author: save info of author who upload video

	Youtube save url of video, They use three party CDN to storage content video. Use sync middle master server and slide master.

