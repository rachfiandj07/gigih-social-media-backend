# Specifications for the Gojek Social Media Backend Project

Specs:
- [x] All features should work, proven by unit tests with at least 90% coverage for models and controllers Should pass all Postman collections submitted in the repository
- [x] Should pass all Postman collections submitted in the repository
- [x] Including README.md 
- [x] Codebase should contain a proper .gitignore
- [x] Commits should show patterns of red-green-commit and refactor-commit
- [x] Should demonstrate proper clean code practices as taught in the classroom
- [x] Codebase should show clear separation of concerns between models, views, and controllers (MVC)
- [x] Database schema should show sensible database design
- [x] Application should be deployed to the provided GCP instance and accessible via ip address.
- [x] Codebase should be committed to a publicly accessible repository (such as Github).
- [x] Database schema should be included in the repository.
- [x] Postman collections that can be used to test all the API endpoints should be included in the repository.

Scope: Your application will be an API-only application with the following stories
- [x] As a user, I want to save my username, email, and bio description. Authentication and authorization is out of scope of this story and you don’t need to implement them
- [x] As a user, I want to post a text that might contain hashtag(s). Maximum limit of a text is 1000 characters. A hashtag is a text that is followed by # symbol, for instance: #generasigigih
- [x] As a user, I want to see all posts that contain a certain hashtag. A user can only filter by one hashtag at a time. As a user, I want to see the list of trending hashtags. Trending hashtags are the top 5 most posted hashtags in the past 24 hours. A post containing multiple instances of a hashtag only counts as 1 occurrence for trending hashtags calculation
- [x] As a user, I want to comment on a post. A comment can contain hashtag(s). A hashtag occurrence in a comment is counted in trending hashtags calculation
- [x] As a user, I want to attach things to a post. Three kinds of attachment are allowed: pictures (jpg, png, gif), video (mp4),and file (any other extensions outside of pictures and videos)

Bonus Point:
- [x] You can provide a web based user interface in addition to your API-only application for bonus points. Remember, this is not a substitute for the API endpoints that you need to provide as the primary submission. Your web based user interface is not counted if you do not deliver the API endpoints.

