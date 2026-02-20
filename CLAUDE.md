# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Technology Stack

- Ruby 3.2.0
- Rails 7.2.1
- PostgreSQL database
- Node.js 22.7.0
- esbuild for JavaScript bundling
- Sass for CSS
- Bootstrap 5.3.3 with jQuery
- RSpec for testing
- FactoryBot and Faker for test data

## Development Commands

### Setup
```bash
bin/setup          # Run initial setup (installs dependencies, creates database)
bundle install     # Install Ruby dependencies
yarn install       # Install JavaScript dependencies
```

### Running the Application
```bash
bin/dev            # Start development server with Foreman (runs Rails, JS, and CSS watchers)
bin/rails server   # Start Rails server only
yarn build --watch # Watch and rebuild JavaScript
yarn build:css --watch # Watch and rebuild CSS
```

### Database
```bash
bin/rails db:create    # Create database
bin/rails db:migrate   # Run pending migrations
bin/rails db:seed      # Load seed data
bin/rails db:reset     # Drop, create, migrate, and seed database
```

### Testing
```bash
bundle exec rspec              # Run all specs
bundle exec rspec spec/models  # Run model specs
bundle exec rspec spec/models/entry_spec.rb  # Run specific spec file
```

### Code Quality
```bash
bin/rubocop        # Run RuboCop linter
bin/brakeman       # Run security analysis
bundle exec standardrb  # Run Standard Ruby formatter
```

### Asset Building
```bash
yarn build         # Build JavaScript with esbuild
yarn build:css     # Build CSS with Sass
```

## Architecture

### Database Schema
The application uses PostgreSQL with two main tables:

- **entries**: Content items with `body` (text), `category` (string), and timestamps
- **tags**: Polymorphic tagging system with `name`, `taggable_type`, and `taggable_id`

### Models
- `Entry`: Uses Kaminari for pagination (`paginates_per 10`), has polymorphic `tags` association
- `Tag`: Polymorphic model that `belongs_to :taggable`

### Controllers and Routes
- Root path routes to `home#index`
- Tech namespace at `/tech` contains `entries` resource
- PWA and health check routes are configured

### Frontend Assets
- JavaScript entry point: `app/javascript/`
- Stylesheets: `app/assets/stylesheets/application.scss`
- Built assets output to: `app/assets/builds/`
- Using Bootstrap 5 with Popper.js and jQuery

### Test Setup
- RSpec with rails_helper for integration tests
- FactoryBot factories in `spec/factories/`
- Faker for test data generation
- System tests use Capybara with Selenium WebDriver

## Development Notes

- The application uses Foreman via `bin/dev` to run multiple processes (web server, JS watcher, CSS watcher)
- Turbo Rails is disabled (commented out in Gemfile)
- Using Rails Omakase RuboCop configuration with Standard
- Database name: `corythosaurus_development`
