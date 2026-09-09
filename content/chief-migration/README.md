# Chief Migration

This repository includes the deploy and init libraries for migrating to a new SKY based Chief.

## Build
```
forge build --use 0.5.12 --out out/0-5-12 --skip script/* test/* test/mocks/* --contracts lib/osm/src
forge build --out out
```

## Regular Test (including deployment and spell execution)
```
forge test
```

## Testnet Deployment, Spell Execution and Test 

### Export env variables

```
export FORK_RPC_URL=<XXX>
export RPC_URL=<XXX>
export PRIVATE_KEY=<XXX>
export DEPLOYER=<XXX>
export FOUNDRY_ROOT_CHAINID=1
export FOUNDRY_EXPORTS_OVERWRITE_LATEST=true
export FOUNDRY_SCRIPT_DEPS="deployed"
export PAUSE_PROXY="0xBE8E3e3618f7474F8cB1d074A26afFef007E98FB"
export PAUSE="0xbE286431454714F511008713973d3B053A2d38f3"
```

### Spin up testnet

on Anvil:
```
anvil --fork-url $FORK_RPC_URL --auto-impersonate
``` 

on Tenderly this is done through their UI

### Deploy (for testing purposes)
```
forge script script/Deploy.s.sol:DeployScript --rpc-url $RPC_URL --broadcast -vvv --sender $DEPLOYER --private-key $PRIVATE_KEY --slow
```

### Run tests with contracts already deployed but not yet initialized
```
TEST_MODE=1 ETH_RPC_URL=$RPC_URL forge test
```

### Change pause proxy owner
This is needed to allow running a spell without it being the real hat.

on Anvil:
```
cast rpc --rpc-url $RPC_URL anvil_setStorageAt $PAUSE_PROXY 0x0 $(cast to-uint256 $DEPLOYER) && \
cast rpc --rpc-url $RPC_URL anvil_mine 0x1 && \
cast call --rpc-url $RPC_URL $PAUSE_PROXY "owner()"
```

on Tenderly testnet:
```
cast rpc --rpc-url $RPC_URL tenderly_setStorageAt $PAUSE_PROXY $(cast to-uint256 0) $(cast to-uint256 $DEPLOYER) && \
cast call --rpc-url $RPC_URL $PAUSE_PROXY "owner()"
```

### Simulate the spell (for testing purposes)
```
forge script script/Init.s.sol:InitScript --rpc-url $RPC_URL --broadcast -vvv --sender $DEPLOYER --slow --use 0.8.21 --unlocked
```

### Change back pause proxy owner to the pause

on Anvil:
```
cast rpc --rpc-url $RPC_URL anvil_setStorageAt $PAUSE_PROXY 0x0 $(cast to-uint256 $PAUSE) && \
cast rpc --rpc-url $RPC_URL anvil_mine 0x1 && \
cast call --rpc-url $RPC_URL $PAUSE_PROXY "owner()"
```

on Tenderly testnet:
```
cast rpc --rpc-url $RPC_URL tenderly_setStorageAt $PAUSE_PROXY $(cast to-uint256 0) $(cast to-uint256 $PAUSE) && \
cast call --rpc-url $RPC_URL $PAUSE_PROXY "owner()"
```

### Run tests with deployed contracts already initialized
```
TEST_MODE=2 ETH_RPC_URL=$RPC_URL forge test
```
