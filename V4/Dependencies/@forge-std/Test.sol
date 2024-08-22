// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2 <0.9.0;
pragma experimental ABIEncoderV2;

// 💬 ABOUT
// Forge Std's default Test.

//--- import headers
import {console} from 'Dependencies/@forge-std/console.sol';
import {console2} from 'Dependencies/@forge-std/console2.sol';
import {safeconsole} from 'Dependencies/@forge-std/safeconsole.sol';
import {StdAssertions} from 'Dependencies/@forge-std/StdAssertions.sol';
import {StdChains} from 'Dependencies/@forge-std/StdChains.sol';
import {StdCheats} from 'Dependencies/@forge-std/StdCheats.sol';
import {stdError} from 'Dependencies/@forge-std/StdError.sol';
import {StdInvariant} from 'Dependencies/@forge-std/StdInvariant.sol';
import {stdJson} from 'Dependencies/@forge-std/StdJson.sol';
import {stdMath} from 'Dependencies/@forge-std/StdMath.sol';
import {StdStorage, stdStorage} from 'Dependencies/@forge-std/StdStorage.sol';
import {StdStyle} from 'Dependencies/@forge-std/StdStyle.sol';
import {stdToml} from 'Dependencies/@forge-std/StdToml.sol';
import {StdUtils} from 'Dependencies/@forge-std/StdUtils.sol';
import {Vm} from 'Dependencies/@forge-std/Vm.sol';

// 📦 BOILERPLATE
import {TestBase} from 'Dependencies/@forge-std/Base.sol';

// ⭐️ TEST
abstract contract Test is TestBase, StdAssertions, StdChains, StdCheats, StdInvariant, StdUtils {
    // Note: IS_TEST() must return true.
    bool public IS_TEST = true;
}