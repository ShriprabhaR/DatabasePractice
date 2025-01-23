---Implement a stored procedure to handle bank account withdrawals. Ensure:
---The withdrawal amount does not exceed the account balance.
---Raise errors for insufficient funds or non-existent accounts.

create proc spWithdraw(
@AccountId tinyint,
@Amount money
)
as
begin
   begin try
      ---check if account exists
	  If Not Exists (select 1 from Account where AccountId = @AccountId)
	  Begin
	     Throw 504, 'Account not found.', 1;
	  end

	  ----check if balance is sufficient
	  Declare @Balance money;
	  select @Balance = Balance from Account where AccountId = @AccountId;

	  if @Balance< @Amount
	  Begin
	      Throw 505, 'Insufficient funds', 1;
	  end

	  ----- Deduct the amount
        UPDATE Account
        SET Balance = Balance - @Amount
        WHERE AccountID = @AccountID;
		PRINT 'Withdrawal successful. Remaining Balance: ' + CAST(@Balance - @Amount AS NVARCHAR(50));
    END TRY
	BEGIN CATCH
        -- Handle errors
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        -- Re-throw the error
        THROW @ErrorSeverity, @ErrorMessage, @ErrorState;
    END CATCH
end;

exec spWithdraw 32, 4300
select @Balance








