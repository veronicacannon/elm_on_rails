# README

This repo is a simple spike to experiment using Elm to embed input fields into a Rails form.

* Rails 6

* Webpacker

The Rails app has:
* model for a company with name, slug, phone and location
* html.erb with a form to add new company

The Elm function:
* embeds name and slug field into Rails form
* generates slug based on name field by stripping out any characters that aren't
letters, numbers, hyphen or underscore.