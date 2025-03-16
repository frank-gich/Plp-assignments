def read_and_modify_file():
    try:
        # Ask the user for the filename
        filename = input("Enter the filename to read: ")
        
        # Attempt to open and read the file
        with open(filename, 'r') as file:
            content = file.read()
        
        # Modify content (convert text to uppercase as an example)
        modified_content = content.upper()

        # Create a new file name for the modified content
        new_filename = f"modified_{filename}"
        
        # Write the modified content to a new file
        with open(new_filename, 'w') as new_file:
            new_file.write(modified_content)
        
        print(f"File successfully modified and saved as '{new_filename}'.")

    except FileNotFoundError:
        print("Error: The file was not found. Please check the filename and try again.")
    except PermissionError:
        print("Error: Permission denied. You may not have the rights to read this file.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

# Run the function
read_and_modify_file()
