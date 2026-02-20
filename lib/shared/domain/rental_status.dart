enum OrderStatus {
  draft,
  pendingApproval,
  rejected,
  approved,
  readyForPickup,
  pickupPendingConfirmation,
  active,
  returnPending,
  returnedWaitOwnerConfirm,
  completed,
  cancelledByRenter,
  cancelledByOwner,
  disputed,
  resolved,
}

enum PaymentStatus {
  unpaid,
  paidHeldInEscrow,
  refundPending,
  refunded,
  payoutPending,
  paidOutToOwner,
  depositHeld,
  depositReleasePending,
  depositPartiallyCaptured,
  depositReleased,
}
