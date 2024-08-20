// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2 <0.9.0;

pragma experimental ABIEncoderV2;

// 💬 ABOUT
// Forge Std's default Test.

// 🧩 MODULES
import {console} from 'hpConquest/V4/Dependencies/@forge-std/console.sol';
import {console2} from 'hpConquest/V4/Dependencies/@forge-std/console2.sol';
import {safeconsole} from 'hpConquest/V4/Dependencies/@forge-std/safeconsole.sol';
import {StdAssertions} from 'hpConquest/V4/Dependencies/@forge-std/StdAssertions.sol';
import {StdChains} from 'hpConquest/V4/Dependencies/@forge-std/StdChains.sol';
import {StdCheats} from 'hpConquest/V4/Dependencies/@forge-std/StdCheats.sol';
import {stdError} from 'hpConquest/V4/Dependencies/@forge-std/StdError.sol';
import {StdInvariant} from 'hpConquest/V4/Dependencies/@forge-std/StdInvariant.sol';
import {stdJson} from 'hpConquest/V4/Dependencies/@forge-std/StdJson.sol';
import {stdMath} from 'hpConquest/V4/Dependencies/@forge-std/StdMath.sol';
import {StdStorage, stdStorage} from 'hpConquest/V4/Dependencies/@forge-std/StdStorage.sol';
import {StdStyle} from 'hpConquest/V4/Dependencies/@forge-std/StdStyle.sol';
import {stdToml} from 'hpConquest/V4/Dependencies/@forge-std/StdToml.sol';
import {StdUtils} from 'hpConquest/V4/Dependencies/@forge-std/StdUtils.sol';
import {Vm} from 'hpConquest/V4/Dependencies/@forge-std/Vm.sol';

// 📦 BOILERPLATE
import {TestBase} from 'hpConquest/V4/Dependencies/@forge-std/Base.sol';

// ⭐️ TEST
abstract contract Test is TestBase, StdAssertions, StdChains, StdCheats, StdInvariant, StdUtils {
    // Note: IS_TEST() must return true.
    bool public IS_TEST = true;
}