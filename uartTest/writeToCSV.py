import csv

def convert_to_csv_one_column(input_file, csv_file):
    try:
        # Open the input file for reading
        with open(input_file, 'r') as f:
            lines = f.readlines()
        
        # Open the CSV file for writing
        with open(csv_file, 'w', newline='') as f:
            writer = csv.writer(f)
            
            # Write all numbers as a single column in CSV
            for line in lines:
                # Split the line into individual numbers
                numbers = line.split()
                # Write each number as a separate row in CSV
                for number in numbers:
                    writer.writerow([number])
        
        print(f'Converted {input_file} to CSV file: {csv_file}')
    
    except IOError as e:
        print(f'Error: {e}')

# Usage example:
input_file = 'output.txt'  # Replace with your output file from previous script
csv_file = 'output.csv'    # Replace with desired CSV file name

convert_to_csv_one_column(input_file, csv_file)
