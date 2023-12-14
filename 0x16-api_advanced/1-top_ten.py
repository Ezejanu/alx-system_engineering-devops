#!/usr/bin/python3
"""
A function that queries the Reddit API and prints the titles
of the first 10 hot posts listed for a given subreddit
"""

import requests


def top_ten(subreddit):
    url = f'https://www.reddit.com/r/{subreddit}/hot.json?limit=10'
    headers = {'User-Agent': 'RedditTopTen'}

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()

        for post in data['data']['children']:
            print(f"{post['data']['title']}")

    else:
        print("None")
