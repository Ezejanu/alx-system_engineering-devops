#!/usr/bin/python3
"""A script returns information about an employee's TODO list progress."""

import requests
import sys


if __name__ == "__main__":
    employee_id = int(sys.argv[1])

    base_url = "https://jsonplaceholder.typicode.com/"
    user_url = "{}users/{}".format(base_url, employee_id)
    todo_url = "{}todos".format(base_url)

    response = requests.get(user_url)
    response_json = response.json()

    todo = requests.get(todo_url, params={"userId": employee_id})
    todo_json = todo.json()

    total_tasks = len(todo_json)
    completed_task = len([task for task in todo_json if task['completed']])
    completed_task_titles = [task['title']
                             for task in todo_json if task['completed']]

    print("Employee {} is done with tasks ({}/{}):"
          .format(response_json['name'], completed_task, total_tasks))
    for title in completed_task_titles:
        print("\t{}".format(title))
