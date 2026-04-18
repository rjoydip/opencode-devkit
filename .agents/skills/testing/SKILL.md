---
name: testing
description: Consolidated testing patterns - TDD, E2E with Playwright, and adversarial testing. Merged from e2e-testing, expect, tdd-guide, and e2e-runner for token efficiency.
---

# Testing Standards

Consolidated from multiple testing sources for efficiency.

## TDD Workflow

1. **Write Test First (RED)** - Always start with failing test
2. **Run Test (Verify FAIL)** - Should fail, no implementation yet
3. **Write Minimal Implementation (GREEN)** - Just enough to pass
4. **Run Test (Verify PASS)** - Should pass now
5. **Refactor (IMPROVE)** - Clean up while keeping tests passing
6. **Verify Coverage** - Ensure 80%+ coverage

```typescript
// Step 1: Write failing test
describe("searchMarkets", () => {
  it("returns semantically similar markets", async () => {
    const results = await searchMarkets("election");
    expect(results).toHaveLength(5);
  });
});
```

## Test Types

### Unit Tests

Test individual functions in isolation:

```typescript
import { calculateSimilarity } from "./utils";

describe("calculateSimilarity", () => {
  it("returns 1.0 for identical embeddings", () => {
    const embedding = [0.1, 0.2, 0.3];
    expect(calculateSimilarity(embedding, embedding)).toBe(1.0);
  });

  it("handles null gracefully", () => {
    expect(() => calculateSimilarity(null, [])).toThrow();
  });
});
```

### Integration Tests

Test API endpoints and database operations.

### E2E Tests

Test complete user journeys with Playwright:

```typescript
import { test, expect } from "@playwright/test";

test("user can search and view market", async ({ page }) => {
  await page.goto("/");
  await page.fill('input[placeholder="Search"]', "election");
  await page.waitForTimeout(600);

  const results = page.locator('[data-testid="market-card"]');
  await expect(results).toHaveCount(5);

  await results.first().click();
  await expect(page).toHaveURL(/\/markets\//);
});
```

## Adversarial Testing (expect-cli)

Use `expect-cli` for browser testing that tries to break things:

```bash
# Install
npm install -g expect-cli

# Run adversarial test
EXPECT_BASE_URL=http://localhost:5173 expect-cli -m "Submit login empty, invalid email, wrong password, valid credentials. Verify error messages and redirect on success." -y
```

**Think like a user trying to break it, not QA confirming it works.**

## Edge Cases to Test

1. Null/Undefined inputs
2. Empty arrays/strings
3. Invalid types
4. Boundary values (min/max)
5. Network/DB errors
6. Race conditions
7. Large data (10k+ items)
8. Special characters

## Test Quality Checklist

- [ ] All public functions have unit tests
- [ ] All API endpoints have integration tests
- [ ] Critical flows have E2E tests
- [ ] Edge cases covered
- [ ] Error paths tested
- [ ] Tests are independent
- [ ] Coverage 80%+

## Coverage Thresholds

- Branches: 80%
- Functions: 80%
- Lines: 80%
- Statements: 80%

## Playwright Config

```typescript
export default defineConfig({
  testDir: "./tests/.e2e",
  fullyParallel: true,
  retries: process.env.CI ? 2 : 0,
  use: {
    baseURL: process.env.BASE_URL || "http://localhost:3000",
    trace: "on-first-retry",
    screenshot: "only-on-failure",
  },
  projects: [{ name: "chromium", use: { ...devices["Desktop Chrome"] } }],
});
```

## Common Flaky Test Fixes

```typescript
// Race conditions - use auto-wait locators
await page.locator('[data-testid="button"]').click();

// Network timing - wait for response
await page.waitForResponse((resp) => resp.url().includes("/api/data"));

// Animation timing - wait for stability
await page.locator('[data-testid="menu-item"]').waitFor({ state: "visible" });
```
