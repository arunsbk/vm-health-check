# VM Health Check Script

## Installation and Usage Instructions for Ubuntu

### Prerequisites
- Ensure you have Python 3.x installed on your Ubuntu system. You can check this by running:
  
  ```bash
  python3 --version
  ```

- Install Git if it’s not already installed:
  
  ```bash
  sudo apt update
  sudo apt install git
  ```

### Clone the Repository
1. Open a terminal.
2. Run the following command to clone the repository:
   
   ```bash
   git clone https://github.com/arunsbk/vm-health-check.git
   ```
   
3. Navigate into the cloned directory:
   
   ```bash
   cd vm-health-check
   ```

### Install Dependencies
1. Ensure you have pip installed on your system. Install it using:
   
   ```bash
   sudo apt install python3-pip
   ```

2. Install any required dependencies (if specified in a requirements.txt):
   
   ```bash
   pip3 install -r requirements.txt
   ```

### Running the Script
1. To run the VM health check script, execute the following command:
   
   ```bash
   python3 health_check.py
   ```

### Output
- The script will provide real-time feedback on the health of the virtual machine and log any issues found.

### Conclusion
- Follow these instructions to successfully install and run the VM health check script on Ubuntu. For any issues or feedback, feel free to raise an issue in the GitHub repository.