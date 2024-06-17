def remove_4369_from_file(input_file, output_file):
    try:
        # Open the input file for reading
        with open(input_file, 'r') as f:
            lines = f.readlines()
        
        # Process each line to remove '4369'
        updated_lines = []
        for line in lines:
            # Split the line into individual numbers
            numbers = line.split()
            # Filter out '4369' from the numbers
            filtered_numbers = filter(lambda x: x != '4369', numbers)
            # Join the filtered numbers back into a line
            updated_line = ' '.join(filtered_numbers)
            updated_lines.append(updated_line)
        
        # Open the output file for writing the modified content
        with open(output_file, 'w') as f:
            for updated_line in updated_lines:
                f.write(updated_line + '\n')
        
        print(f'Removed occurrences of "4369" from {input_file}.')
    
    except IOError as e:
        print(f'Error: {e}')

# Usage example:
input_file = 'akselInput.txt'    # Replace with your input file name
output_file = 'output.txt'  # Replace with your desired output file name

remove_4369_from_file(input_file, output_file)
