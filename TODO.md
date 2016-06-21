## Priority

- Email to schedule meeting -> Open Mantis Issue
- Figure out what to do about Matlab script?

- Make python code use json file:

    ```
    {"maps":[{"id":"blabla","iscategorical":"0"},{"id":"blabla","iscategorical":"0"}],
    "masks":{"id":"valore"},
    "om_points":"value",
    "parameters":{"id":"valore"}
    }
    Then you can use your code:

    import json
    from pprint import pprint

    with open('data.json') as data_file:
        data = json.load(data_file)

    pprint(data)
    With data, you can now also find values like so:

    data["maps"][0]["id"]
    data["masks"]["id"]
    data["om_points"]
    ```

    Source: http://stackoverflow.com/a/2835672/3219667

- Add pin diagram to electronics subfolder
- Fix Fan Hookup (real)
- Double Check Cold tile and device operation

## LATER

- Add UI to software folder