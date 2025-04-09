# BitLend Protocol - Decentralized BTC-Backed Lending

**Version:** 1.0.0  
**Network:** Stacks Layer 2  
**Compliance:** Bitcoin-native asset management

---

## Protocol Overview

A non-custodial lending system enabling BTC holders to mint stablecoins against collateral while maintaining Bitcoin exposure. Implements automated risk management directly on Bitcoin's security layer through Stacks L2.

---

## Technical Architecture

### Core Components

1. **Collateral Management Engine**

   - BTC price oracle integration
   - Dynamic collateral ratio enforcement (150% minimum)
   - Real-time collateral value tracking

2. **Loan Lifecycle System**

   - Loan origination with compound interest
   - Block-based interest calculation (144 blocks/day)
   - Multi-stage repayment workflows

3. **Risk Mitigation Layer**

   - Automated liquidation triggers (120% threshold)
   - Collateral health monitoring
   - Loan status transitions (active → liquidated/repaid)

4. **Governance Framework**
   - Parameter adjustment controls
   - Price feed management
   - Protocol fee structure (1% platform fee)

---

## Contract Specifications

### Key Constants

| Constant                | Value              | Purpose                               |
| ----------------------- | ------------------ | ------------------------------------- |
| `CONTRACT-OWNER`        | Transaction sender | Admin rights holder                   |
| `MIN_COLLATERAL_RATIO`  | 150%               | Minimum collateralization requirement |
| `LIQUIDATION_THRESHOLD` | 120%               | Auto-liquidation trigger point        |
| `PLATFORM_FEE`          | 1%                 | Protocol revenue mechanism            |

### State Variables

- `platform-initialized`: Boot status flag
- `total-btc-locked`: Aggregate collateral holdings
- `total-loans-issued`: Loan counter
- `collateral-prices`: Oracle price storage

---

## Core Functionality

### 1. Collateral Operations

**Deposit Mechanism**

```clarity
(define-public (deposit-collateral (amount uint))
  ;; Requires minimum 1 satoshi deposit
  ;; Updates total-btc-locked counter
)
```

### 2. Loan Management

**Loan Origination**

```clarity
(define-public (request-loan (collateral uint) (loan-amount uint))
  ;; 5% base interest rate
  ;; Requires 150% collateralization
  ;; Generates unique loan ID
```

**Repayment Process**

```clarity
(define-public (repay-loan (loan-id uint) (amount uint))
  ;; Handles interest calculation
  ;; Returns collateral on full repayment
  ;; Updates loan status to 'repaid'
```

---

## Risk Management System

### Liquidation Workflow

1. Continuous collateral ratio monitoring
2. Price feed-triggered health checks
3. Automated position closure at 120% threshold
4. Collateral forfeiture protocol

```clarity
(define-private (check-liquidation (loan-id uint))
  ;; Compares current ratio vs threshold
  ;; Executes liquidation via private method
```

---

## Governance Controls

### Parameter Adjustment Functions

```clarity
(define-public (update-collateral-ratio (new-ratio uint))
  ;; Owner-restricted
  ;; Minimum 110% floor enforcement
```

```clarity
(define-public (update-price-feed (asset string) (new-price uint))
  ;; Oracle management
  ;; Supports BTC/STX assets
```

---

## Security Model

### Audit Considerations

1. Price feed validation safeguards
2. Collateral ratio sanity checks
3. Loan status transition validations
4. Authorization layers for critical operations

### Attack Mitigations

- Front-running protection via block height tracking
- Reentrancy guards through state management
- Oracle manipulation resistance via price validation

---

## Integration Guide

### Contract Interaction Flow

1. Initialize platform (owner-only)
2. Configure price feeds
3. Deposit BTC collateral
4. Request/Manage loans
5. Monitor positions via read-only functions

### Key Read Operations

```clarity
(define-read-only (get-loan-details (loan-id uint))
  ;; Returns full loan state
```

```clarity
(define-read-only (get-platform-stats)
  ;; Provides protocol-level metrics
```
