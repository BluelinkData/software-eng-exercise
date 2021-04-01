# Software Engineer: Coding Exercise

Woohoo, let’s work together to engage with new donors over text message to thank them and get them involved in the campaign.

This short exercise should take about 30 minutes.

## Background

Let's say we're helping a campaign better engage their donors.

The campaign has lots of online donation forms on the ActBlue platform. All have SMS opt-in language (the “By providing your cell phone number...” disclaimer at the bottom), so as soon as somebody makes a donation, if they’ve supplied their cell phone number, we can subscribe them to a text message list and send them a "welcome" text. We use a platform called Mobile Commons to send these texts and manage the subscribers list. We want to send this text as soon as possible after the person has donated.

ActBlue offers webhook functionality, so we can set up an endpoint that ActBlue will hit whenever we get a new donation. Mobile Commons offers an API which we can POST to to subscribe a phone number. So the goal here is to set up a webhook that will immediately subscribe new donors to our text message list.

## Step 0: Set up Docker and run tests

Install Docker if you haven’t already ([instructions for Mac](https://docs.docker.com/docker-for-mac/install/)). Clone the `software-eng-exercise` repo (the repo containing this document):

https://github.com/BluelinkData/software-eng-exercise

From inside the `software-eng-exercise` repo, run these commands to set up and run its container:

`make build up`

Leave this running. In a separate console, run tests with:

`make test`

They should all pass. Reach out to us if something isn’t behaving, we want to help!

## Step 1: Implement `upload_to_mobilecommons()` in actblue/actblue.py

First, you’ll want to read through `actblue/test_actblue.py`. The goal of this step is to make all the tests in this file pass.

Next, open `actblue/actblue.py` and take a look at `upload_to_mobilecommons()`. Right now it simply raises NotImplementedError.

Remove the `raise(NotImplementedError)` and run `make test`. This makes two tests fail.

Now, let’s implement `upload_to_mobilecommons()` so the tests pass!

You can refer to [ActBlue’s webhook documentation](https://secure.actblue.com/docs/webhooks) and the sample incoming donation payload used in tests `actblue/sample_donation.json`. See Appendix 1 below for the relevant Mobile Commons API endpoint documentation (unfortunately their documentation is not publicly accessible :-/).

## Step 2: Send us your `actblue.py`

The email you received should have a link like https://app2.greenhouse.io/tests/UNIQUE_TOKEN to submit your actblue.py. Thank you!

(Next steps of the interview process may involve a screen-share coding interview building on top of your work in this repo.)

## Appendix 1. Mobile Commons `profile_update` endpoint documentation

Mobile Commons API documentation is behind a login wall, so it's pasted here:

URL:	https://secure.mcommons.com/api/profile_update

Protocol:	HTTP POST

Parameters:	

- phone_number (Required)
- email
- postal_code
- first_name
- last_name
- street1
- street2
- city
- state
- country
- opt_in_path_id: This will subscribe the user to this campaign and send the message flow in this opt-in path. The value should be your opt-in path key.
