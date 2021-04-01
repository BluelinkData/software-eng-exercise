build:
	docker build --tag exercise .

up:
	docker run --name exercise-web --volume `pwd`:/app --publish 5005:5005 --rm exercise

test:
	docker exec exercise-web python -m pytest -vv
