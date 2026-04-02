---
name: debugging
description: Debugging techniques, logging strategies, and troubleshooting patterns for AI agents.
---

# Debugging

Systematic debugging approaches and techniques.

## Debugging Workflow

1. **Reproduce** - Can you consistently reproduce the issue?
2. **Isolate** - Find the minimal case that triggers it
3. **Hypothesize** - Form a theory about what's wrong
4. **Test** - Verify your hypothesis
5. **Fix** - Implement the solution
6. **Verify** - Confirm the fix works

## Console Logging

```typescript
// Use structured logging
console.log({
  action: "fetchUser",
  userId: "123",
  timestamp: new Date().toISOString(),
});

// Use console.error for errors
console.error("Failed to fetch:", error);

// Use console.warn for warnings
console.warn("Deprecated: use newMethod instead");
```

## Error Handling

```typescript
// Wrap in try-catch with context
try {
  const result = await riskyOperation();
  return result;
} catch (error) {
  console.error({
    operation: "riskyOperation",
    error: error instanceof Error ? error.message : error,
    stack: error instanceof Error ? error.stack : undefined,
  });
  throw new Error("Failed to complete operation");
}

// Create custom error types
class AppError extends Error {
  constructor(
    message: string,
    public code: string,
    public statusCode: number = 500
  ) {
    super(message);
    this.name = "AppError";
  }
}
```

## TypeScript Debugging

```typescript
// Use type narrowing
function process(value: unknown) {
  if (typeof value === "string") {
    return value.toUpperCase(); // TS knows it's string
  }
  // Handle other types
}

// Add type assertions for debugging (remove after)
const value = unknownValue as ExpectedType;

// Use satisfies for type checking
const config = {
  port: 3000,
} satisfies Record<string, number>;
```

## Async Debugging

```typescript
// Add logging to async operations
async function fetchData() {
  console.log("fetchData: starting");
  try {
    const result = await fetch("/api/data");
    console.log("fetchData: received response");
    return result.json();
  } catch (error) {
    console.error("fetchData: failed", error);
    throw error;
  }
}

// Check for unhandled rejections
process.on("unhandledRejection", (reason) => {
  console.error("Unhandled rejection:", reason);
});
```

## Common Issues

### "Cannot read property of undefined"

```typescript
// Problem
const name = user.profile.name; // Fails if profile is undefined

// Solution: optional chaining
const name = user?.profile?.name;

// Or provide default
const name = user?.profile?.name ?? "Unknown";
```

### Race Conditions

```typescript
// Problem: stale state in async
const handleClick = async () => {
  setLoading(true);
  // If user clicks again before this completes...
  const data = await fetchData();
  setData(data); // May set wrong data
};

// Solution: track request
let requestId = 0;
const handleClick = async () => {
  const currentId = ++requestId;
  setLoading(true);
  const data = await fetchData();
  if (currentId === requestId) {
    setData(data);
  }
  setLoading(false);
};
```

### Memory Leaks

```typescript
// Problem: not cleaning up subscriptions
useEffect(() => {
  const subscription = api.subscribe(data => setData(data));
  // Missing cleanup!
}, []);

// Solution: return cleanup function
useEffect(() => {
  const subscription = api.subscribe(data => setData(data));
  return () => subscription.unsubscribe();
}, []);
```

## Browser DevTools

- **Console**: View logs, errors
- **Network**: Inspect HTTP requests
- **Sources**: Set breakpoints, step through code
- **Application**: View localStorage, sessionStorage, cookies

## Node.js Debugging

```bash
# Debug mode
node --inspect server.js

# With break on start
node --inspect-brk server.js

# VS Code debug config
{
  "type": "node",
  "request": "launch",
  "name": "Debug Server",
  "runtimeExecutable": "npm",
  "runtimeArgs": ["run", "dev"]
}
```

## Logging Libraries

```typescript
// pino - fast JSON logging
import pino from "pino";
const logger = pino({ level: "info" });

// winston - flexible logging
import winston from "winston";
const logger = winston.createLogger({
  level: "info",
  format: winston.format.json(),
  transports: [new winston.transports.Console()],
});
```

## Quick Debug Checklist

- [ ] Check console for errors
- [ ] Check network tab for failed requests
- [ ] Verify API responses
- [ ] Check types with TypeScript
- [ ] Add console.log to trace execution
- [ ] Use debugger; statement to pause
- [ ] Verify environment variables
- [ ] Check for race conditions
- [ ] Check for null/undefined values
