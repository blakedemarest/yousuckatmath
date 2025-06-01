# Git Workflow Guidelines

This document describes the Git workflow, branch naming conventions, and commit message standards for the YouSuckAtMath.com project.

## Branching Strategy

We follow a modified Git Flow branching model:

### Main Branches

- `main`: The production branch, containing code that is deployed to production.
- `develop`: The development branch, containing code that is ready for the next release.

### Supporting Branches

- `feature/*`: Feature branches, used for developing new features.
- `bugfix/*`: Bug fix branches, used for fixing bugs.
- `hotfix/*`: Hot fix branches, used for urgent fixes to production.
- `release/*`: Release branches, used for preparing releases.
- `docs/*`: Documentation branches, used for updating documentation.
- `refactor/*`: Refactoring branches, used for code refactoring without changing functionality.

## Branch Naming Conventions

All branch names should be in lowercase, with words separated by hyphens.

### Format

```
<branch-type>/<issue-number>-<short-description>
```

### Examples

- `feature/123-user-authentication`
- `bugfix/456-login-validation`
- `hotfix/789-security-vulnerability`
- `release/v1.0.0`
- `docs/update-api-documentation`
- `refactor/optimize-textbook-processing`

## Commit Message Conventions

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc.)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools
- `ci`: Changes to CI/CD configuration files and scripts

### Scope

The scope is optional and should be the name of the component affected (e.g., `auth`, `api`, `ui`, `db`).

### Examples

```
feat(auth): add email verification during registration
```

```
fix(ui): resolve responsive layout issues on mobile devices

This commit fixes the layout issues on mobile devices by updating the CSS Grid implementation.

Closes #123
```

## Workflow

### Creating a Feature

1. Create a new branch from `develop`:
   ```
   git checkout develop
   git pull
   git checkout -b feature/123-user-authentication
   ```

2. Make changes and commit them:
   ```
   git add .
   git commit -m "feat(auth): implement user registration"
   ```

3. Push the branch to GitHub:
   ```
   git push -u origin feature/123-user-authentication
   ```

4. Create a pull request to merge into `develop`.

### Bug Fixes

1. Create a new branch from `develop`:
   ```
   git checkout develop
   git pull
   git checkout -b bugfix/456-login-validation
   ```

2. Fix the bug and commit the changes:
   ```
   git add .
   git commit -m "fix(auth): validate email format during login"
   ```

3. Push the branch to GitHub:
   ```
   git push -u origin bugfix/456-login-validation
   ```

4. Create a pull request to merge into `develop`.

### Hotfixes

1. Create a new branch from `main`:
   ```
   git checkout main
   git pull
   git checkout -b hotfix/789-security-vulnerability
   ```

2. Fix the issue and commit the changes:
   ```
   git add .
   git commit -m "fix(security): address critical vulnerability in authentication"
   ```

3. Push the branch to GitHub:
   ```
   git push -u origin hotfix/789-security-vulnerability
   ```

4. Create a pull request to merge into both `main` and `develop`.

### Releases

1. Create a new branch from `develop`:
   ```
   git checkout develop
   git pull
   git checkout -b release/v1.0.0
   ```

2. Make any final adjustments and commit them:
   ```
   git add .
   git commit -m "chore(release): prepare v1.0.0"
   ```

3. Push the branch to GitHub:
   ```
   git push -u origin release/v1.0.0
   ```

4. Create a pull request to merge into `main`.
5. After the pull request is approved and merged, tag the release in `main`:
   ```
   git checkout main
   git pull
   git tag -a v1.0.0 -m "Release v1.0.0"
   git push origin v1.0.0
   ```
6. Merge `main` back into `develop`:
   ```
   git checkout develop
   git pull
   git merge main
   git push
   ```

## Pull Request Guidelines

- All pull requests must be reviewed by at least one other team member
- All automated checks must pass before merging
- The branch should be up-to-date with the target branch before merging
- All comments and discussions must be resolved before merging
- Use squash and merge when appropriate to keep the commit history clean

## Git Tips

### Keeping Your Branch Up to Date

Regularly sync your branch with the parent branch:

```
git checkout develop
git pull
git checkout your-branch
git merge develop
```

### Resolving Merge Conflicts

If you encounter merge conflicts:

1. Resolve the conflicts in your code editor
2. Add the resolved files:
   ```
   git add .
   ```
3. Complete the merge:
   ```
   git commit
   ```

### Amending Commits

To amend the most recent commit:

```
git commit --amend
```

To amend the most recent commit without changing the commit message:

```
git commit --amend --no-edit
```

### Interactive Rebase

To clean up commits before creating a pull request:

```
git rebase -i HEAD~n  # n is the number of commits to include
```

---

This document should be reviewed and updated as needed to reflect changes in our development workflow.
