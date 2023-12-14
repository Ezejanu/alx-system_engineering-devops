#!/usr/bin/python3
# A function that queries the Reddit API and returns the number of total
# subscribers for a given subreddit

import requests


def number_of_subscribers(subreddit):
    # function for fetching subreddit information

    url = f'https://www.reddit.com/r/{subreddit}/about.json'

    headers = {'User-Agent': 'MyRedditSubs/1.0'}

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()

        if 'data' in data and 'subscribers' in data['data']:
            return data['data']['subscribers']
        else:
            return 0
    else:
        return 0
