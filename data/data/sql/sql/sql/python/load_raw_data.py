import pandas as pd
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = BASE_DIR / "data"


def load_csv(file_name: str) -> pd.DataFrame:
    file_path = DATA_DIR / file_name

    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")

    df = pd.read_csv(file_path)
    print(f"Loaded {file_name}: {len(df)} records")
    return df


def main():
    customers_df = load_csv("customers.csv")
    products_df = load_csv("products.csv")
    transactions_df = load_csv("transactions.csv")

    print("\nRaw data loaded successfully.")
    print(f"Customers: {customers_df.shape}")
    print(f"Products: {products_df.shape}")
    print(f"Transactions: {transactions_df.shape}")


if __name__ == "__main__":
    main()
