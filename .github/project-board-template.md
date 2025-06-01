# Project Board Template for YouSuckAtMath.com

This document defines the structure for the project board used to track tasks and issues.

## Columns

### 1. Backlog
Tasks and issues that have been identified but not yet planned for implementation.

### 2. To Do
Tasks that have been prioritized and are ready to be worked on in the current or upcoming sprint.

### 3. In Progress
Tasks that are actively being worked on by team members.

### 4. Review
Tasks that have been completed and are awaiting review (code review, design review, etc.).

### 5. Done
Tasks that have been completed, reviewed, and merged/deployed.

## Labels

### Priority
- `priority:high`: Needs to be addressed as soon as possible
- `priority:medium`: Should be addressed in the current sprint
- `priority:low`: Can be addressed in future sprints

### Type
- `type:feature`: New functionality
- `type:bug`: Bug fixes
- `type:refactor`: Code improvements without changing functionality
- `type:docs`: Documentation updates
- `type:test`: Test-related tasks
- `type:chore`: Maintenance tasks

### Component
- `component:frontend`: Web interface related
- `component:backend`: Server and API related
- `component:ai-tutor`: AI tutoring functionality
- `component:textbook`: Textbook processing and management
- `component:learning-path`: Learning path functionality
- `component:auth`: Authentication and authorization
- `component:database`: Database models and migrations
- `component:infrastructure`: DevOps and infrastructure

### Phase
- `phase:1-mvp`: Phase 1 MVP tasks
- `phase:2-core`: Phase 2 Core Platform tasks
- `phase:3-advanced`: Phase 3 Advanced Features tasks
- `phase:4-scale`: Phase 4 Scale and Expand tasks

## Sprint Planning

Sprints will be two weeks in duration, starting on Monday and ending on Friday of the following week.

### Sprint Ceremonies
1. **Sprint Planning**: First day of sprint (Monday)
2. **Daily Standups**: Every workday, 15 minutes
3. **Sprint Review**: Last day of sprint (Friday)
4. **Sprint Retrospective**: Last day of sprint (Friday, after review)

### Story Points
We will use the Fibonacci sequence for estimating tasks:
1, 2, 3, 5, 8, 13, 21

1 point ≈ half day of work for one developer
