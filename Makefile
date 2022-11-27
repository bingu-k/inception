all : up

up:
	mkdir -p /home/byeukim/data/wp /home/byeukim/data/db
	sudo echo "127.0.0.1	byeukim.42.fr"
	docker-compose -f ./src/docker-compose.yml up --build

down:
	docker-compose -f ./src/docker-compose.yml down

clean:
	docker-compose -f ./src/docker-compose.yml down -v --rmi all

fclean: clean
	sudo rm -fr -f /home/byeukim/data/wp /home/byeukim/data/db

re: fclean all

.PHONY: all up down clean fclean re