
import crypto from "crypto";
export type Block = {
  index: number;
  timestamp: string;
  transactions: any[];
  previous_hash: string;
  current_hash: string;
};

export function isValidBlock(block: Block): boolean {
  const data =
    block.index.toString() +
    block.timestamp +
    JSON.stringify(block.transactions) +
    block.previous_hash;

  const hash = crypto.createHash("sha256").update(data).digest("hex");

  return hash === block.current_hash;
}
