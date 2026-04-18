---
name: security
description: Security best practices, common vulnerabilities, and secure coding patterns for AI agents.
---

# Security Best Practices

Critical security guidelines for all code.

## Authentication

### Password Handling

```typescript
// NEVER store plain passwords
// BAD
const user = { password: "mypassword" };

// GOOD: Hash passwords
import { hash, verify } from "@node-rs/argon2";

const hashedPassword = await hash(password);
const isValid = await verify(hashedPassword, password);
```

### JWT Tokens

```typescript
// Sign tokens with expiry
const token = await jwt.sign({ userId: user.id }, process.env.JWT_SECRET!, { expiresIn: "7d" });

// Verify tokens
try {
  const decoded = await jwt.verify(token, process.env.JWT_SECRET!);
} catch (error) {
  throw new Error("Invalid token");
}
```

## Input Validation

```typescript
// Always validate user input
import { z } from "zod";

const UserSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8).max(100),
  name: z.string().min(1).max(100),
});

const validated = UserSchema.parse(input);
```

## SQL Injection Prevention

```typescript
// GOOD: Parameterized queries
const user = await db.query("SELECT * FROM users WHERE email = $1", [email]);

// BAD: String concatenation
const user = await db.query("SELECT * FROM users WHERE email = '" + email + "'");
```

## XSS Prevention

```typescript
// Escape HTML when rendering
import { escape } from "html-escaper";

// In React: auto-escapes by default
// <div>{userInput}</div> - safe

// Be careful with dangerouslySetInnerHTML
// BAD
<div dangerouslySetInnerHTML={{ __html: userInput }} />

// GOOD: Sanitize first
import DOMPurify from "isomorphic-dompurify";
<div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(userInput) }} />
```

## Environment Variables

```typescript
// NEVER hardcode secrets
// BAD
const apiKey = "sk-abc123";

// GOOD: Environment variables
const apiKey = process.env.API_KEY;
if (!apiKey) throw new Error("API_KEY not configured");
```

## Rate Limiting

```typescript
// Implement rate limiting
import { rateLimit } from "express-rate-limit";

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // 100 requests per window
  message: "Too many requests",
});

app.use("/api/", limiter);
```

## CORS

```typescript
// Configure CORS properly
import cors from "cors";

app.use(
  cors({
    origin: process.env.ALLOWED_ORIGIN,
    credentials: true,
  }),
);
```

## Security Checklist

- [ ] No hardcoded secrets in code
- [ ] All inputs validated with Zod/schemas
- [ ] Parameterized SQL queries
- [ ] HTML escaped in templates
- [ ] Rate limiting on endpoints
- [ ] HTTPS only (secure cookies)
- [ ] CORS properly configured
- [ ] CSRF protection enabled
- [ ] Dependencies up to date
- [ ] Security headers set

## Common Vulnerabilities

| Vulnerability     | Prevention                  |
| ----------------- | --------------------------- |
| SQL Injection     | Parameterized queries       |
| XSS               | Escape HTML, sanitize input |
| CSRF              | CSRF tokens                 |
| IDOR              | Authorization checks        |
| Command Injection | Avoid exec with user input  |
| Path Traversal    | Validate file paths         |
