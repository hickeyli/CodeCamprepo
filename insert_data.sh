#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate tables before inserting new data
echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY")

# Read and insert data from games.csv
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip the header row
  if [[ $YEAR != "year" ]]
  then
    # Check if the winner team is already in the teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # If not found, insert the winner team
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
      # Get the new winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # Check if the opponent team is already in the teams table
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # If not found, insert the opponent team
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $OPPONENT"
      fi
      # Get the new opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # Insert the game data
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into games: $YEAR $ROUND $WINNER vs $OPPONENT"
    fi
  fi
done