# Contributing to YouSuckAtMath.com

Thank you for considering contributing to YouSuckAtMath.com! This document outlines our development workflow, coding standards, and guidelines for contributing to the project.

## Development Workflow

### 1. Branching Strategy

We follow the Git Flow branching model:

- `main`: Production-ready code
- `develop`: Latest development code
- `feature/*`: New features (branch from `develop`)
- `bugfix/*`: Bug fixes (branch from `develop`)
- `release/*`: Release preparation
- `hotfix/*`: Emergency production fixes (branch from `main`)

### 2. Issue Tracking

- All work should be tied to an issue in our issue tracker
- Use the issue number in branch names (e.g., `feature/123-user-authentication`)
- Reference the issue number in commit messages using #XXX format

### 3. Pull Request Process

1. Create a branch from `develop` for your work
2. Make your changes, following our coding standards
3. Write tests for your changes
4. Ensure CI passes (lint, tests, build)
5. Submit a PR to `develop`
6. Request reviews from appropriate team members
7. Address review comments
8. Merge only after approval

## Coding Standards

### JavaScript/TypeScript

- Follow ESLint configuration
- Use Prettier for formatting
- Use TypeScript for type safety
- Follow functional programming principles where appropriate
- Use React hooks and functional components

### Python

- Follow PEP 8 style guide
- Use Black for formatting and isort for import sorting
- Use type hints
- Write docstrings for all functions, classes, and modules
- Follow the principle of least privilege

### Documentation

- Document all public APIs
- Keep README files up to date
- Document complex algorithms and business logic
- Add comments for non-obvious code

## Commit Message Format

Follow the Conventional Commits standard:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Types:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools

## Testing Standards

- Write unit tests for all new code
- Maintain test coverage above 80%
- Use mock objects for external dependencies
- Test edge cases and error conditions
- Consider property-based testing for complex functions

## Code Review Guidelines

When reviewing code:

1. Check for adherence to coding standards
2. Verify proper test coverage
3. Look for security vulnerabilities
4. Consider performance implications
5. Ensure documentation is complete
6. Validate business logic correctness

## Getting Help

If you need help with the contribution process:

- Ask questions in the project's communication channels
- Reach out to project maintainers
- Check existing documentation and examples

Thank you for helping to improve YouSuckAtMath.com!
