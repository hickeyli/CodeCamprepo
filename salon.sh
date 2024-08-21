#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

# Function to display the list of services
DISPLAY_SERVICES() {
  echo -e "\nHere are the available services:"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}

# Function to prompt user for service selection and handle input
GET_SERVICE() {
  echo -e "\nPlease select a service by entering the service ID:"
  read SERVICE_ID_SELECTED

  # Check if the service ID exists in the services table
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
  then
    # If service ID is invalid, display services again and prompt for input
    echo -e "\nInvalid service ID. Please try again."
    DISPLAY_SERVICES
    GET_SERVICE
  else
    # Proceed if service ID is valid
    GET_CUSTOMER_INFO
  fi
}

# Function to get customer information
GET_CUSTOMER_INFO() {
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE

  # Check if the customer already exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    # If the customer does not exist, prompt for their name
    echo -e "\nIt looks like you are a new customer. Please enter your name:"
    read CUSTOMER_NAME

    # Insert the new customer into the customers table
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  # Proceed to get appointment time
  GET_APPOINTMENT_TIME
}

# Function to get appointment time
GET_APPOINTMENT_TIME() {
  echo -e "\nPlease enter the appointment time:"
  read SERVICE_TIME

  # Get the customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Insert the appointment into the appointments table
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Output confirmation message
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
}

# Main script starts here
DISPLAY_SERVICES
GET_SERVICE