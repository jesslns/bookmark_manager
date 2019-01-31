## Bookmark Manager

Week 4 pairing project. Instructions can be found [here](https://github.com/makersacademy/course/blob/master/bookmark_manager/00_challenge_map.md)

### User Stories
```
As a user,<br>
I would like to save and see my list of bookmarks.
```
```
As a user, <br>
I would like to add and delete bookmarks <br>
so that I can update bookmarks <br>
```
```
As a user, <br>
I would like to tag my bookmarks into categories, <br>
so that I can filter bookmarks by tag and mange them.
```

### Domain Model

<div style='float: center'>
<img style='width: 300px' src="./public/images/domain_model.png">
</div>

### Instructions on Using SQL Database
- Install <b>PostgreSQL</b> `$brew install postgresql`
- Connect to `psql`;
- Create the database using the `psql` command `CREATE - DATABASE bookmark_manager`;
- Connect to the database using the `pqsl` command `\c - bookmark_manager`;
- Run the query we have saved in the file `01_create_bookmarks_table.sql`

#### Setting up Test Environment
- Create database for testing by `createdb bookmark_manager_test`;
- Create `bookmarks` table using the `psql` command `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60))`;
- Connect to the database using the `pqsl` command `\c - bookmark_manager`
