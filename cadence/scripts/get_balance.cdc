// This script reads the balance field of an account's FlowToken Balance

/* 
    Direct Imports
*/ 
// import FungibleToken from 0x9a0766d93b6608b7
// import FlowToken from 0x7e60df042a9c0868

/* 
    Flow.json Imports
*/ 
import "FungibleToken"
import "FlowToken"

access(all) fun main(account: Address): UFix64 {

    let vaultRef = getAccount(account)
        .capabilities.borrow<&FlowToken.Vault>(/public/flowTokenBalance)
        ?? panic("Could not borrow a balance reference to the FlowToken Vault in account "
                .concat(account.toString()).concat(" at path /public/flowTokenBalance. ")
                .concat("Make sure you are querying an address that has ")
                .concat("a FlowToken Vault set up properly at the specified path."))

    return vaultRef.balance
}