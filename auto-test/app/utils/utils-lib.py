from datetime import datetime, timedelta

def format_with_k(number):
    """
    Convert a decimal number to format with K replacing 3 last digits (thousands).

    Examples:
        - 100000 -> "100 K"
        - 1000000 -> "1,000 K"
        - 500000.10 -> "500.1 K"
        - 1500000.50 -> "1,500.5 K"
        - 1234567.89 -> "1,234.6 K"
    """
    # Convert to float and handle negative numbers
    num = float(number)
    is_negative = num < 0
    num = abs(num)

    # Divide by 1000 to get thousands
    thousands = num / 1000

    # Format with 1 decimal place (if needed)
    # Check if there's a fractional part
    if thousands % 1 == 0:
        # No decimal part, format as integer with commas
        formatted = f"{thousands:,.0f}"
    else:
        # Has decimal part, keep 1 decimal place
        formatted = f"{thousands:,.1f}"

    # Add K and handle negative
    result = f"{formatted} K"
    return f"-{result}" if is_negative else result


def reformat_to_utc7(dt_string):
    """
    Convert ISO datetime to UTC+7 with format "hh:mm dd/MM/yyyy"

    Args:
        dt_string: ISO format datetime (e.g., "2026-06-28T10:51:30.654Z")

    Returns:
        Formatted string in UTC+7: "17:51 28/06/2026"

    Examples:
        "2026-06-28T10:51:30.654Z" -> "17:51 28/06/2026"
        "2026-06-28T15:30:00.000Z" -> "22:30 28/06/2026"
        "2026-06-28T00:00:00.000Z" -> "07:00 28/06/2026"
    """
    try:
        # Parse ISO format
        if dt_string.endswith('Z'):
            dt = datetime.fromisoformat(dt_string.replace('Z', '+00:00'))
        else:
            dt = datetime.fromisoformat(dt_string)

        # Add 7 hours for UTC+7
        dt_utc7 = dt + timedelta(hours=7)

        # Format as "hh:mm dd/MM/yyyy"
        formatted = dt_utc7.strftime("%H:%M %d/%m/%Y")
        return formatted

    except Exception as e:
        return f"Error: {e}"

def convert_date_to_utc7_without_time(date_string):
    """
    Convert ISO datetime to UTC+7 date only (remove time part)

    Args:
        date_string: ISO format datetime (e.g., "2026-06-29T03:08:51.207Z")

    Returns:
        Date in UTC+7: "29/06/2026"

    Examples:
        "2026-06-29T03:08:51.207Z" -> "29/06/2026"
        "2026-06-28T23:59:59.999Z" -> "29/06/2026" (after UTC+7 conversion)
    """
    try:
        # Parse ISO format
        if date_string.endswith('Z'):
            dt = datetime.fromisoformat(date_string.replace('Z', '+00:00'))
        else:
            dt = datetime.fromisoformat(date_string)

        # Add 7 hours for UTC+7
        dt_utc7 = dt + timedelta(hours=7)

        # Format as date only: "DD/MM/YYYY"
        formatted = dt_utc7.strftime("%d/%m/%Y")
        return formatted

    except Exception as e:
        return f"Error: {e}"


def format_with_k_from_original(number, decimals=None):
    """
    Format number with K suffix and thousand separators

    Args:
        number: Number or string
        decimals: Number of decimal places (default: None - auto detect from input)

    Returns:
        Formatted string with K suffix and comma separators

    Examples:
        10 -> "10 K"
        1000 -> "1,000 K"
        1500 -> "1,500 K"
        1500.50 -> "1,500.50 K"
        19.62 -> "19.62 K"
        1000.7 -> "1,000.7 K"
        1234.567 -> "1,234.567 K"
    """
    try:
        # Convert to string to analyze decimal places
        num_str = str(number).strip()

        # Auto-detect decimal places if not specified
        if decimals is None:
            if '.' in num_str:
                # Count decimal places
                decimals = len(num_str.split('.')[1])
            else:
                decimals = 0

        # Convert to float
        num = float(number)

        # Format with thousand separators and decimal places
        if decimals == 0:
            formatted = f"{int(num):,}"
        else:
            formatted = f"{num:,.{decimals}f}"

        # Add K suffix
        return f"{formatted} K"

    except (ValueError, TypeError):
        return f"Error: Invalid input '{number}'"
