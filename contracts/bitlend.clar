;; Title: BitLend - Decentralized BTC-Backed Lending Protocol on Stacks L2
;; Summary: Secure Bitcoin-native lending with automated risk management
;; Description:
;; BitLend is a non-custodial lending protocol enabling BTC holders to access liquidity while maintaining 
;; Bitcoin exposure. Built on Stacks Layer 2 for Bitcoin compliance, the protocol features:
;; - BTC collateralization with dynamic price feeds
;; - Risk-managed loans with adjustable collateral ratios (150%+)
;; - Automated liquidation protection (120% threshold)
;; - Decentralized governance for parameter adjustments
;; - Real-time interest accrual calculated per block
;; - Transparent loan tracking with on-chain auditability
;; Designed for capital efficiency and Bitcoin DeFi integration, BitLend maintains full compatibility with
;; Bitcoin's security model while enabling sophisticated financial primitives on Stacks L2.

;; Constants
(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INSUFFICIENT-COLLATERAL (err u101))
(define-constant ERR-BELOW-MINIMUM (err u102))
(define-constant ERR-INVALID-AMOUNT (err u103))
(define-constant ERR-ALREADY-INITIALIZED (err u104))
(define-constant ERR-NOT-INITIALIZED (err u105))
(define-constant ERR-INVALID-LIQUIDATION (err u106))
(define-constant ERR-LOAN-NOT-FOUND (err u107))
(define-constant ERR-LOAN-NOT-ACTIVE (err u108))

;; Additional constants for validation
(define-constant ERR-INVALID-LOAN-ID (err u109))
(define-constant ERR-INVALID-PRICE (err u110))
(define-constant ERR-INVALID-ASSET (err u111))
(define-constant VALID-ASSETS (list "BTC" "STX"))

;; Data Variables
(define-data-var platform-initialized bool false)
(define-data-var minimum-collateral-ratio uint u150) ;; 150% collateral ratio
(define-data-var liquidation-threshold uint u120) ;; 120% triggers liquidation
(define-data-var platform-fee-rate uint u1) ;; 1% platform fee
(define-data-var total-btc-locked uint u0)
(define-data-var total-loans-issued uint u0)

;; Data Maps
(define-map loans
    { loan-id: uint }
    {
        borrower: principal,
        collateral-amount: uint,
        loan-amount: uint,
        interest-rate: uint,
        start-height: uint,
        last-interest-calc: uint,
        status: (string-ascii 20)
    }
)