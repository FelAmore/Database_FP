import mysql.connector
from prettytable import PrettyTable
 
def user_login():
    print("Welcome to FAMDb!!")
    user_type = input("Are you a 'user' or an 'admin'? ").strip().lower()
    if user_type == "admin":
        rilpassword = "adminpass"
        password = input("Enter the admin password: ")
        if password == rilpassword:
            admin_menu()
        else:
            print("Access denied.")
            exit()
    elif user_type == "user":
        user_main()
    else:
        print("Invalid. Please enter the available position.")
        user_login()

def connect_to_database():
    host = "localhost"
    user = "Felise"
    password = "felazzadbpass"
    database = "MyDb"

    try:
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
        return connection
    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None

def choice_one(connection):
    query = """
        SELECT
            Movies.MovieID,
            Movies.Movie_Title,
            GROUP_CONCAT(DISTINCT Genres.Genre_Name SEPARATOR ', ') AS Genres,
            GROUP_CONCAT(DISTINCT OG_Network.OGNetwork_Name SEPARATOR ', ') AS Networks
        FROM
            Movies
        LEFT JOIN MovieGenres ON MovieGenres.MovieID = Movies.MovieID
        LEFT JOIN Genres ON Genres.GenreID = MovieGenres.GenreID
        LEFT JOIN MovieNetwork ON MovieNetwork.MovieID = Movies.MovieID
        LEFT JOIN OG_Network ON OG_Network.OGNetworkID = MovieNetwork.OGNetworkID
        GROUP BY Movies.MovieID
        ORDER BY Movies.Release_Year
    """
    run_query(connection, query)

def choice_two(connection):
    query = f"""
        SELECT
        Genres.Genre_Name, COUNT(MovieGenres.MovieID) AS movie_count
        
        FROM
        Genres
        
        LEFT JOIN MovieGenres ON MovieGenres.GenreID = Genres.GenreID
        
        GROUP BY
        Genres.Genre_Name
    """
    run_query(connection, query)

def choice_three(title, connection):
    query = f"""
        SELECT 
            People.Name, Movies.Movie_Title, Role.Role_Name
        FROM 
            People 
        JOIN MoviePeople ON MoviePeople.PeopleID = People.PeopleID
        JOIN Role ON Role.RoleID = MoviePeople.RoleID
        JOIN Movies ON Movies.MovieID = MoviePeople.MovieID
        WHERE
            Movies.Movie_Title LIKE '%{title}%'
    """
    run_query(connection, query)

def choice_four(network, year, connection):
    query = f"""
        SELECT
        Movies.Movie_Title, Genres.Genre_Name
        
        FROM
        Movies
        
        LEFT JOIN MovieGenres ON MovieGenres.MovieID = Movies.MovieID
        LEFT JOIN Genres ON Genres.GenreID = MovieGenres.GenreID
        LEFT JOIN MovieNetwork ON MovieNetwork.MovieID = Movies.MovieID
        LEFT JOIN OG_Network ON OG_Network.OGNetworkID = MovieNetwork.OGNetworkID
        
        WHERE
        OG_Network.OGNetwork_Name LIKE '%{network}%'
        
        AND
        Movies.Release_Year = {year};
        """
    run_query(connection, query)


def choice_five(name, connection):
    query = f"""
        SELECT
        People.Name, Movies.Movie_Title, Role.Role_Name
        
        FROM
        Movies
        
        JOIN MoviePeople ON MoviePeople.MovieID = Movies.MovieID
        JOIN People ON People.PeopleID = MoviePeople.PeopleID
        JOIN Role ON MoviePeople.RoleID = Role.RoleID
        
        WHERE
        People.Name LIKE '%{name}%';
        """
    run_query(connection, query)

def choice_six(connection):
    query = f"""
        SELECT Genres.Genre_Name
        
        FROM Genres
            
        LEFT JOIN MovieGenres ON MovieGenres.GenreID = Genres.GenreID
        
        WHERE MovieGenres.GenreID IS NULL;
        """
    run_query(connection, query)

def choice_seven(network, connection):
    query = f"""
        SELECT 
        Movies.Movie_Title, OG_Network.OGNetwork_Name
        
        FROM 
        MovieNetwork
        
        LEFT JOIN Movies ON Movies.MovieID = MovieNetwork.MovieID
        LEFT JOIN OG_Network ON MovieNetwork.OGNetworkID = OG_Network.OGNetworkID
        
        WHERE
        OG_Network.OGNetwork_Name LIKE '%{network}%'
        """
    run_query(connection, query)


def choice_eight(role, connection):
    query = f"""
        SELECT 
        People.Name
        
        FROM 
        People
        
        JOIN MoviePeople ON MoviePeople.PeopleID = People.PeopleID
        JOIN Role ON Role.RoleID = MoviePeople.RoleID
        
        WHERE
        Role.Role_Name LIKE '%{role}%';
        """
    run_query(connection, query)

def choice_nine(genre, connection):
    query = f"""
        SELECT Movies.Movie_Title, Genres.Genre_Name
        
        FROM Movies
        
        JOIN MovieGenres ON MovieGenres.MovieID = Movies.MovieID
        JOIN Genres ON Genres.GenreID = MovieGenres.GenreID
        
        WHERE
        Genres.Genre_Name LIKE '%{genre}%';
        """
    run_query(connection, query)

def choice_ten(title, connection):
    query = f"""
        SELECT
        Movies.Movie_Title, Movies.Synopsis, Genres.Genre_Name, OG_Network.OGNetwork_Name, Movies.Release_Year
        
        FROM
        Movies
        
        LEFT JOIN MovieGenres ON MovieGenres.MovieID = Movies.MovieID
        LEFT JOIN Genres ON Genres.GenreID = MovieGenres.GenreID
        LEFT JOIN MovieNetwork ON MovieNetwork.MovieID = Movies.MovieID
        LEFT JOIN OG_Network ON OG_Network.OGNetworkID = MovieNetwork.OGNetworkID
        
        WHERE
        Movies.Movie_Title LIKE '%{title}%'
    """
    run_query(connection, query)

def run_query(connection, query):
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Debug print to check results immediately after fetching them
        print("DEBUG RESULTS:", results)
        
        # If results exist, proceed to format and print them in a table
        if results:
            print("\nQuery Results:")
            table = PrettyTable()
            table.field_names = [i[0] for i in cursor.description]
            for result in results:
                table.add_row(result)
            print(table)
        else:
            print("No results found.")
    except mysql.connector.Error as e:
        print(f"Error running the query: {e}")
    finally:
        cursor.close()   

def user_menu():
    table = PrettyTable()
    table.field_names = ["Menu", "Description"]
    table.align["Description"] = "l"

    menus = [
        ("1", "Retrieve movies along with their genres and networks"),       
        ("2", "List all genres available with the count of movies in each genre"),
        ("3", "List all the people involved in a certain movie"),        
        ("4", "Get movies and their genres that are available on a specific network and were released in a specific year"),
        ("5", "List movies and the roles played by a person name"),
        ("6", "Retrieve all genres that are not associated with any movies"),
        ("7", "List all the movies titles that are available on a specific network (e.g., HBO)"),
        ("8", "Retrieve people associated with a specific role"),
        ("9", "Retrieve movies based on their genres"),
        ("10", "Search by title"),
        ("0", "Log out"),
        ("q", "Exit"),
    ]

    table.add_rows(menus)
    print(table)

def user_main():
    print("✨|WELCOME TO FAMDb|✨")

    while True:
        # print menu
        user_menu()

        # get user's input and store it in the var choice
        choice = int(input("👉🏻 Enter your choice (0-10): ").lower())

        # Connect to the database
        connection = connect_to_database()

        if connection:
            if choice == 1:
                choice_one(connection)
            elif choice == 2:
                choice_two(connection)
            elif choice == 3:
                title = input("What movie do you wanna get: ")
                choice_three(title, connection)
            elif choice == 4:
                network = input("Enter original network (e.g., HBO): ")
                year = int(input("Enter year (2008/2015/2022/2023): "))
                choice_four(network, year, connection)
            elif choice == 5:
                name = input("Enter a name: ")
                choice_five(name, connection)
            elif choice == 6:
                choice_six(connection)
            elif choice == 7:
                network = input("Enter the original network (e.g., HBO): ")
                choice_seven(network, connection)
            elif choice == 8:
                role = input("Enter the role (Director/Screenwriter/Cast): ")
                choice_eight(role, connection)
            elif choice == 9:
                genre = input("Enter a genre: ")
                choice_nine(genre, connection)
            elif choice == 10:
                title = input("Enter movie title: ")
                choice_ten(title, connection)
            elif choice == 0:
                user_login()
            elif choice == 'q':
                print("Thankyou for using FAMDb🤗")
                quit()
            else:
                print("There is no such menu. Choose something else.")

            # Close the connection
            if connection.is_connected():
                connection.close()
                print(" ")

def add_movie(connection):
    try:
        title = input("Enter movie title: ")
        synopsis = input("Enter movie synopsis: ")
        release_year = input("Enter release year: ")
        genre_ids = input("Enter genre IDs separated by commas: ")
        network_ids = input("Enter network IDs separated by commas: ")
        
        add_movie_query = "INSERT INTO movies (Movie_Title, Synopsis, Release_Year) VALUES (%s, %s, %s)"
        cursor = connection.cursor()
        cursor.execute(add_movie_query, (title, synopsis, release_year))
        movie_id = cursor.lastrowid
        
        for genre_id in genre_ids.split(','):
            genre_id = genre_id.strip()
            if genre_id:
                add_genre_query = """
                INSERT INTO moviegenres (MovieID, GenreID) VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE GenreID = VALUES(GenreID)
                """
                cursor.execute(add_genre_query, (movie_id, genre_id))
                print(f"Added Genre ID: {genre_id} for Movie ID: {movie_id}")

            # Insert networks associated with the movie
            for network_id in network_ids.split(','):
                network_id = network_id.strip()
                if network_id:
                    add_network_query = """
                    INSERT INTO movienetwork (MovieID, OGNetworkID) VALUES (%s, %s)
                    ON DUPLICATE KEY UPDATE OGNetworkID = VALUES(OGNetworkID)
                    """
                    cursor.execute(add_network_query, (movie_id, network_id))
                    print(f"Added Network ID: {network_id} for Movie ID: {movie_id}")

            connection.commit()
            print("Movie added successfully with ID:", movie_id)

    except mysql.connector.Error as e:
        print(f"Error adding movie: {e}")
        connection.rollback()
    finally:
        cursor.close()

def edit_movie(connection):
    movie_id = input("Enter the ID of the movie to edit: ")
    new_title = input("Enter the new title (leave blank to keep current): ")
    new_year = input("Enter the new release year (leave blank to keep current): ")
    new_network_id = input("Enter the new network ID (leave blank to keep current): ")

    cursor = connection.cursor()

    # Update the movies table
    if new_title or new_year:
        movie_update_query = "UPDATE movies SET "
        update_parts = []
        update_values = []

        if new_title:
            update_parts.append("Movie_Title = %s")
            update_values.append(new_title)

        if new_year:
            update_parts.append("Release_Year = %s")
            update_values.append(new_year)

        movie_update_query += ", ".join(update_parts)
        movie_update_query += " WHERE MovieID = %s"
        update_values.append(movie_id)

        cursor.execute(movie_update_query, update_values)
        connection.commit()
        print("Movie updated successfully.")

    # Update the movienetwork table
    if new_network_id:
        network_update_query = "UPDATE movienetwork SET OGNetworkID = %s WHERE MovieID = %s"
        cursor.execute(network_update_query, (new_network_id, movie_id))
        connection.commit()
        print("Movie network updated successfully.")

    cursor.close()

def delete_movie(connection):
    movie_id = input("Enter the ID of the movie to delete: ")

    cursor = connection.cursor()

    try:
        # Delete related records in child tables first
        cursor.execute("DELETE FROM moviegenres WHERE MovieID = %s", (movie_id,))
        cursor.execute("DELETE FROM movienetwork WHERE MovieID = %s", (movie_id,))
        # Add similar DELETE statements for other related tables if necessary

        # Now, attempt to delete the movie
        delete_movie_query = "DELETE FROM movies WHERE MovieID = %s"
        cursor.execute(delete_movie_query, (movie_id,))
        connection.commit()
        print("Movie deleted successfully.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        connection.rollback()  # Rollback in case of error
    finally:
        cursor.close()


def admin_menu():
    print("✨|WELCOME TO FAMDb Admin Page|✨")

    while True:
        # Connect to the database
        connection = connect_to_database()
        print("\nAdmin Menu:")
        print("1. Add Movie")
        print("2. Edit Movie")
        print("3. Delete Movie")
        print("4. Log out")
        print("0. Exit")

        # get user's input and store it in the var choice
        choice = input("Enter your choice: ")
        if choice == '1':
            add_movie(connection)
        elif choice == '2':
            edit_movie(connection)
        elif choice == '3':
            delete_movie(connection)
        elif choice == '4':
            user_login()
        elif choice == '0':
            exit()
        else:
            print("Invalid choice, please try again.")

if __name__ == "__main__":
    user_login()
